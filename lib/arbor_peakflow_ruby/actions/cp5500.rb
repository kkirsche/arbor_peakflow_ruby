module Arbor
  module Peakflow
    class Client
      # The CP 5500 function allows you to view CP 5500 appliance configurations
      # in JSON format. *Note:* This function is only available with
      # appliance-based licensing for Traffic and Analysis Routing appliances
      # (formally Collector Platform (CP) appliances).
      #
      # == Parameters:
      # - action: One of the following actions that you want to initiate:
      # list, show_schema, update.
      # - filter: (Optional) Keywords by which you want to filter search
      # results. You can enter the same search strings that you can enter in
      # the Search box on the Configure Routers page in the Web UI.
      #
      # ==== Example
      #
      #    response = client.cp5500 'show_schema'
      def cp5500(action, filter = nil)
        response = @conn.get do |req|
          req.url 'arborws/admin/cp5500'
          req.params['api_key'] = @api_key
          req.params['action'] = action
          req.params['filter'] = filter unless filter.nil?
        end

        response
      end
    end
  end
end
