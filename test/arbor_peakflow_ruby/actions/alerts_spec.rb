require 'minitest_helper'
module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Alerts', 'The Arbor Web Services API alert info' do
      it 'should retrieve JSON alert data' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/alerts' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.alerts 'filter', 100, 'format'
        expect(response).wont_be_nil
      end
    end
  end
end
