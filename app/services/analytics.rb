require 'google/apis/analyticsreporting_v4'

class Analytics

  def initialize
    @base_url = "https://hirozak.space"
    @view_id  = "177685128"
    @analytics = Google::Apis::AnalyticsreportingV4
    auth
  end


  def popular_posts
    date_range = @analytics::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
    metric = @analytics::Metric.new(expression: 'ga:users', alias: 'users')
    dimension = @analytics::Dimension.new(name: 'ga:pagePath')
    order_by = @analytics::OrderBy.new(field_name: 'ga:users', sort_order: 'DESCENDING')
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
        end
      end
    end

    return posts

  end

  private

    def auth
      scope = ['https://www.googleapis.com/auth/analytics.readonly']
      @client = @analytics::AnalyticsReportingService.new
      @client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open('google-auth-cred.json'),
        scope: scope
      )
    end

end
