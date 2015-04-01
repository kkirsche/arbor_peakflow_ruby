module Arbor
  module Peakflow
    module Managed_Object
      # The managed object function allows you to view managed object configuration data in JSON format.
      #
      # == Parameters:
      # - +filter+: (Optional) Keywords by which you want to filter search results. You can enter the same search strings that you can enter in the Search box on the Managed Objects pages in the Web UI.
      #
      # ==== Example
      #
      #    response = client.managed_object 'dorms'
      def managed_object(filter = nil)
        response = @client.get('arborws/admin/managed_object',
                               {}.tap do |hash|
                                 hash[:api_key] = @api_key
                                 hash[:filter] = filter unless filter.nil?
                               end)

        response.body = JSON.parse(response.body)

        response
      end
    end
  end
end
