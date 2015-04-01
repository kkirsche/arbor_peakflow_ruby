require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'CP5500', 'The Arbor Web Services API CP5500 appliance settings' do
      it 'should retrieve JSON CP5500 appliance info' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/admin/cp5500' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.cp5500 'action', 'filter'
        response.wont_be_nil
      end
    end
  end
end
