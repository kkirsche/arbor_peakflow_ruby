require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Managed Object', 'The Arbor Web Services API Managed Object options' do
      it 'should retrieve JSON Managed Object data' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/admin/managed_object' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.managed_object 'filter'
        expect(response).wont_be_nil
      end
    end
  end
end
