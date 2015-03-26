module Arbor
  module Peakflow
    module Routers
      # The routers function allow syou to view router configuration in JSON
      # format.
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
      #    response = client.routers 'show_schema'
      def routers(action, filter = nil)
        response = @conn.get do |req|
          req.url 'arborws/admin/routers'
          req.params['api_key'] = @api_key
          req.params['action'] = action
          req.params['filter'] = filter unless filter.nil?
        end

        response
      end
    end
  end
end
