module Arbor
  module Peakflow
    module Mitigations
      # The mitigations function allows you to search for and retrieve JSON and XML mitigation information.
      #
      # == Parameters:
      # - +filter+: (Optional) Keywords by which you want to filter search results. You can enter the same search strings that you can enter in the Search box on the Mitigations pages in the Web UI.
      # - +limit+: (Optional) The maximum number of mitigations to return that match the filter.
      # - +format+: The format in which you want the data returned: `json` or `xml`
      #
      # ==== Example
      #
      #    response = client.mitigations 'auto-mitigation', 10, 'json'
      def mitigations(filter = nil, limit = nil, format = 'json')
        url_filter_limit_format_request('arborws/mitigations/status', filter,
                                        limit, format)
      end
    end
  end
end
