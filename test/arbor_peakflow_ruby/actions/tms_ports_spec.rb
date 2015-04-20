require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'TMS Ports', 'The Arbor Web Services API TMS Port data' do
      it 'should retrieve JSON TMS Port data' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/admin/tms_ports' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        response = client.tms_ports
        expect(response).wont_be_nil
      end
    end
  end
end
