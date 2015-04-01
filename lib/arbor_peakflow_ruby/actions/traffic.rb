module Arbor
  module Peakflow
    # The Traffic module is for getting traffic data.
    module Traffic
      # The traffic function allows you to search for and retrieve XML traffic
      # data.
      #
      # == Parameters:
      # - query: An XML query in standard Peakflow SP XML query format. This
      # parameter is only the XML query, not an entire XML report. Data is
      # returned in the XML result format, as specified in the _Peakflow SP and
      # Threat Management System (TMS) User Guide_. For current report
      # specifications, see "Using Cusomized Reports" in the _Peakflow SP and
      # Threat Management System (TMS) User Guide_.
      # - graph: (Optional) When specified, this parameter indicates that you
      # want Peakflow SP to return a binary PNG graph file of the queried
      # traffic data. If you do not specify a graph argument, then Peakflow SP
      # returns XML.
      #
      # ==== Example
      #
      #    query = File.read('path/to/file.xml')
      #    response = client.traffic query
      def traffic(query, graph = nil)
        query = remove_returns_and_spaces(query) unless query.nil?
        graph = remove_returns_and_spaces(graph) unless graph.nil?

        response = @client.get('arborws/traffic',
                               {}.tap do |hash|
                                 hash[:api_key] = @api_key
                                 hash[:query] =  query unless query.nil?
                                 hash[:graph] = graph unless graph.nil?
                               end)

        response
      end

      # The remove_returns_and_spaces function allows you to remove newlines and spaces that are not within tags in XML.
      #
      # == Parameters:
      # - file_contents: The XML content which should be cleaned in preparation for URL encoding.
      #
      # ==== Example
      #
      #    file = File.read('path/to/file.xml')
      #    clean_file = client.remove_returns_and_spaces file
      def remove_returns_and_spaces(file_contents)
        clean_file =
            file_contents
            .gsub!(/\n+/, '')
            .gsub!(/(\s+)(?![^<])/, '')

        clean_file
      end
    end
  end
end
