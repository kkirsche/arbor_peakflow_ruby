module Arbor
  module Peakflow
    module Reports
      # Allows you to view a list of the configured wizard reports in Peakflow
      # SP
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
      #    response = client.configured_reports
      def configured_reports(filter = nil, limit = nil, format = 'json')
        url_filter_limit_format_request('arborws/reports/configured', filter,
                                        limit, format)
      end

      # Allows you to queue a wizard report to run
      #
      # == Parameters:
      # - name: The name of the configured wizard report that you want to run.
      # The returned value is one of the following: an HTTP status code 204,
      # which indicates success or an error message.
      #
      # ==== Example
      #
      #    response = client.queue_report 'example_report'
      def queue_report(name)
        response = @client.get('arborws/reports/queue', api_key: @api_key,
                                                        name: name)

        response
      end

      # Allows you to view a list of wizard report results that can be
      # downloaded from Peakflow SP.
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
      #    response = client.report_results
      def report_results(filter = nil, limit = nil, format = 'json')
        url_filter_limit_format_request('arborws/reports/results', filter,
                                        limit, format)
      end

      # Allows you to download a completed wizard report.
      #
      # == Parameters:
      # - name: The name of the configured wizard report result that you want
      # to download.
      # - request_time: The time of the wizard report result that you want to
      # download, which can be one of the following: last (The "last" parameter
      # downloads the most recent wizard report result), time (the "time"
      # parameter is the time at which a wizard report ran, in seconds and
      # microseconds since the epoch.)
      # - format: The format in which you want a wizard report returned, which
      # can be one of the following: "PDF", "XML", "CSV".
      #
      # ==== Example
      #
      #    response = client.download_report 'myReport', 'last', 'PDF'
      def download_report(name, request_time, format)
        response = @client.get('arborws/reports/configured',
                               api_key: @api_key, name: name,
                               request_time: request_time, format: format)

        response
      end
    end
  end
end
