require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'TMS Appliance', 'The Arbor Web Services API tms appliance options' do
      it 'should retrieve JSON TMS Appliance data ' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/admin/tms' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.tms_appliance 'action', 'filter'
        expect(response).wont_be_nil
      end
    end
  end
end
