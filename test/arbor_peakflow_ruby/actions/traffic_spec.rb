require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Traffic', 'The Arbor Web Services API tms port options' do
      it 'should retrieve JSON tms appliance data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.traffic ''
          response.wont_be_nil
        end
      end

      it 'should retrieve JSON tms port data with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/admin/managed_object' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, query: 'query')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          data = %(
            <?xml version="1.0" encoding="utf-8"?>
            <peakflow version="2.0">
              <query type="traffic">
                <time start_ascii="24 hours ago" end_ascii="now"/>
                <unit type="bps"/>
                <search limit="100" timeout="30"/>
                <class type="in"/>
                <class type="out"/>
                <filter type="customer">
                  <instance name="CustomerName"/>
                </filter>
                <filter type="application" binby="1"/>
              </query>
            </peakflow>
          )
          client.traffic data
          @mock_request.verify
        end
      end
    end
  end
end
