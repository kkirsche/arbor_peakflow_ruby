module Arbor
  module Peakflow
    module TMS_Ports
      # The TMS Ports function allows you to view TMS appliance port data in
      # JSON format.
      #
      # ==== Example
      #
      #    response = client.tms_ports
      def tms_ports
        response = @client.get('arborws/admin/tms_ports', api_key: @api_key)

        response.body = JSON.parse(response.body)

        response
      end
    end
  end
end
