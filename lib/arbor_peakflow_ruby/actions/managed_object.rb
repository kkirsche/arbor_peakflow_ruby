module Arbor
  module Peakflow
    class Client
      # The managed object function allows you to view managed object
      # configuration data in JSON format.
      #
      # == Parameters:
      # - filter: (Optional) Keywords by which you want to filter search
      # results. You can enter the same search strings that you can enter in
      # the Search box on the Managed Objects pages in the Web UI.
      #
      # ==== Example
      #
      #    response = client.managed_object 'dorms'
      def managed_object(filter = nil)
        response = @conn.get do |req|
          req.url 'arborws/admin/managed_object'
          req.params['api_key'] = @api_key
          req.params['filter'] = filter unless filter.nil?
        end

        response
      end
    end
  end
end