module Arbor
  module Peakflow
    module Alerts
      # The alerts function allows you to search for and retrieve JSON or XML
      # alert information.
      #
      # == Parameters:
      # - filter: (Optional) Keywords by which you want to filter search
      # results. You can enter the same search strings that you can enter in
      # the Search box on the Alerts pages in the Web UI.
      # - limit: (Optional) The maximum number of alerts to return that match
      # the filter.
      # - format: The format in which you want the data returned:
      # 'json' or 'xml'
      #
      # ==== Example
      #
      #    response = client.alerts 'host', 100, 'json'
      def alerts(filter = nil, limit = nil, format = 'json')
        response = @conn.get do |req|
          req.url 'arborws/alerts'
          req.params['api_key'] = @api_key
          req.params['format'] = format
          req.params['filter'] = filter unless filter.nil?
          req.params['limit'] = limit unless limit.nil?
        end

        response
      end
    end
  end
end
