module Arbor
  module Peakflow
    class Client
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
      def traffic(query, graph = nil)
        response = @conn.get do |req|
          req.url 'arborws/traffic'
          req.params['api_key'] = @api_key
          req.params['query'] = query
          req.params['graph'] = graph unless graph.nil?
        end

        response
      end
    end
  end
end
