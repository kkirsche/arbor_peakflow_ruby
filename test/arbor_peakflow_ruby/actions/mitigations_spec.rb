require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Mitigations', 'The Arbor Web Services API mitigation options' do
      it 'should retrieve JSON Mitigations data' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/mitigations/status' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.mitigations 'filter', 100, 'json'
        expect(response).wont_be_nil
      end
    end
  end
end
