require 'google/apis/analyticsreporting_v4'
require 'google/api_client/auth/key_utils'

namespace :analytics do
  desc 'get popular posts from google analytics'

  task popular_posts: :environment do
    keyfile = Rails.root.join('google_analytics.p12')
    analytics = Google::Apis::AnalyticsreportingV4
    client = analytics::AnalyticsReportingService.new
    client.authorization = Signet::OAuth2::Client.new(
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      audience: 'https://accounts.google.com/o/oauth2/token',
      scope: 'https://www.googleapis.com/auth/analytics.readonly',
      issuer: ENV['GA_ISSUER'],
      signing_key: Google::APIClient::KeyUtils.load_from_pkcs12(keyfile, ENV['GA_KEY_SECRET'])
    )
    client.authorization.fetch_access_token!

    view_id = ENV['GA_VIEW_ID']
    metric = analytics::Metric.new(expression: 'ga:pageviews', alias: 'pageviews')
    dimension = analytics::Dimension.new(name: 'ga:pagePath')
    date_range = analytics::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
    order_by = analytics::OrderBy.new(field_name: 'ga:pageviews', sort_order: 'DESCENDING')
    request = analytics::GetReportsRequest.new(
      report_requests: [analytics::ReportRequest.new(
        view_id: view_id,
        metrics: [metric],
        dimensions: [dimension],
        date_ranges: [date_range],
        order_bys: [order_by]
      )]
    )
    response = client.batch_get_reports(request)

    data = response.reports.first.data
    num = 0
    data.rows.each do |row|
      next unless row.dimensions.to_s.include?('/posts/')

      slug = row.dimensions.first.to_s[7..-1]
      post = Post.find_by(slug: slug)
      next if post.nil?

      num += 1
      popular_post = PopularPost.where(rank: num).first_or_create! do |new_popular_post|
        new_popular_post.rank = num
        new_popular_post.post = post
      end
      popular_post.update!(post_id: post.id)
      puts "#{num}: #{row.metrics.first.values.first}views: #{post.title}"
      break if num == 8
    end
  end
end
