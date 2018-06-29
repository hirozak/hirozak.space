require 'google/apis/analyticsreporting_v4'
require 'google/api_client/auth/key_utils'

class Analytics

  def initialize
    @base_url = "https://hirozak.space"
    @view_id  = "177685128"
    @analytics = Google::Apis::AnalyticsreportingV4
    authorize!
  end


  def popular_posts
    date_range = @analytics::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
    metric = @analytics::Metric.new(expression: 'ga:pageviews', alias: 'pageviews')
    dimension = @analytics::Dimension.new(name: 'ga:pagePath')
    order_by = @analytics::OrderBy.new(field_name: 'ga:pageviews', sort_order: 'DESCENDING')
    request = @analytics::GetReportsRequest.new(
      report_requests: [@analytics::ReportRequest.new(
        view_id: @view_id,
        metrics: [metric],
        dimensions: [dimension],
        date_ranges: [date_range],
        order_bys: [order_by]
      )]
    )
    response = @client.batch_get_reports(request)

    data = response.reports.first.data

    posts = []

    data.rows.each do |row|
      if row.dimensions.to_s.include?("posts")
        slug = row.dimensions.first.to_s[7..-1]
        if post = Post.find_by(slug: slug)
          posts << post
          break if posts.length == 5
        end
      end
    end

    return posts

  end

  private

    def signing_key
      return if @signing_key

      keyfile = Rails.root.join('google_analytics.p12')

      passphrase = ENV["GA_KEY_SECRET"]
      @signing_key = Google::APIClient::KeyUtils.load_from_pkcs12(keyfile, passphrase)
    end

    def authorize!
      @client = @analytics::AnalyticsReportingService.new
      @client.authorization = Signet::OAuth2::Client.new(
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        audience: 'https://accounts.google.com/o/oauth2/token',
        scope: 'https://www.googleapis.com/auth/analytics.readonly',
        issuer: 'hirozak-space-ga@hirozak-space.iam.gserviceaccount.com', # EDIT
        signing_key: signing_key
      )
      @client.authorization.fetch_access_token!
    end
end
