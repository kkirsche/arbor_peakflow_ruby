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
        response = @conn.get do |req|
          req.url 'arborws/traffic'
          req.params['api_key'] = @api_key
          req.params['query'] = encode_xml_for_url(query)
          req.params['graph'] = encode_xml_for_url(graph) unless graph.nil?
        end

        response
      end

      # The encode_xml_for_url function allows you to encode an XML file's
      # content. This is used automatically when calling the traffic method.
      #
      # == Parameters:
      # - file_contents: The XML content which should be encoded into a URL
      # usable format.
      #
      # ==== Example
      #
      #    file = File.read('path/to/file.xml')
      #    encoded_file_contents = client.encode_xml_for_url file
      def encode_xml_for_url(file_contents)
        encoded_file =
          URI.encode(
            file_contents
              .gsub!(/\n+/, '')
              .gsub!(/(\s+)(?![^<])/, '')
          ).gsub!(/\?/, '%3F')

        encoded_file
      end
    end
  end
end
