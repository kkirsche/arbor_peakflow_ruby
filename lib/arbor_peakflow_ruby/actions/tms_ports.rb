module Arbor
  module Peakflow
    class Client
      # The TMS Ports function allows you to view TMS appliance port data in
      # JSON format.
      #
      # ==== Example
      #
      #    response = client.tms_ports 'show_schema'
      def tms_ports
        response = @conn.get do |req|
          req.url 'arborws/admin/tms_ports'
          req.params['api_key'] = @api_key
        end

        response
      end
    end
  end
end
