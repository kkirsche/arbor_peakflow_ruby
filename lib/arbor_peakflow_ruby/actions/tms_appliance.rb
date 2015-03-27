module Arbor
  module Peakflow
    module TMS_Appliance
      # The TMS function allows you to view and update TMS appliance
      # configurations in JSON format.
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
      #    response = client.tms_appliance 'show_schema'
      def tms_appliance(action, filter = nil)
        url_action_filter_request('arborws/admin/tms', action, filter)
      end
    end
  end
end
