require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Routers', 'The Arbor Web Services API router options' do
      it 'should retrieve JSON router data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.routers 'action'
          response.wont_be_nil
        end
      end

      it 'should retrieve JSON router data with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/admin/managed_object' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, action: 'action')
        @mock_request.expect(:params, filter: 'filter')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.routers 'action', 'filter'
          @mock_request.verify
        end
      end
    end
  end
end
