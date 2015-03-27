require 'minitest_helper'
module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Alerts', 'The Arbor Web Services API alert info' do
      it 'should retrieve JSON alert info' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.alerts
          response.wont_be_nil
        end
      end

      it 'should retrieve JSON alert info with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/alerts' }, [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, filter: 'host')
        @mock_request.expect(:params, limit: 100)
        @mock_request.expect(:params, format: 'json')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.alerts 'host', 100, 'json'
          @mock_request.verify
        end
      end
    end
  end
end
