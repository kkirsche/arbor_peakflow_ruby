module Arbor
  module Peakflow
    module Alerts
      # The alerts function allows you to search for and retrieve JSON or XML
      # alert information.
      #
      # == Parameters:
      # - +filter+: (Optional) Keywords by which you want to filter search results. You can enter the same search strings that you can enter in the Search box on the Alerts pages in the Web UI.
      # - +limit+: (Optional) The maximum number of alerts to return that match the filter.
      # - +format+: The format in which you want the data returned: `json` or `xml`
      #
      # ==== Example
      #
      #    response = client.alerts 'host', 100, 'json'
      def alerts(filter = nil, limit = nil, format = 'json')
        url_filter_limit_format_request('arborws/alerts', filter, limit, format)
      end
    end
  end
end
