require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Reports', 'The Arbor Web Services API reports options' do
      it 'should retrieve JSON configured report data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.configured_reports
          response.wont_be_nil
        end
      end

      it 'should retrieve JSON configured report data with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/reports/configured' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, filter: 'filter')
        @mock_request.expect(:params, limit: 100)
        @mock_request.expect(:params, format: 'json')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.configured_reports 'filter', 100, 'json'
          @mock_request.verify
        end
      end

      it 'should queue report data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.queue_report 'name'
          response.wont_be_nil
        end
      end

      it 'should queue reports data with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/reports/queue' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, name: 'name')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.queue_report 'name'
          @mock_request.verify
        end
      end

      it 'should retrieve JSON report results data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.report_results
          response.wont_be_nil
        end
      end

      it 'should retrieve JSON report results with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/reports/results' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, filter: 'filter')
        @mock_request.expect(:params, limit: 100)
        @mock_request.expect(:params, format: 'json')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.report_results 'filter', 100, 'json'
          @mock_request.verify
        end
      end

      it 'should download report data' do
        @mock_network = Minitest::Mock.new
        @mock_network.expect(:get, id: '123456')

        @mock_request = Minitest::Mock.new
        @mock_request.expect(:request, true, [Symbol])
        @mock_request.expect(:adapter, true, [Symbol])

        Faraday.stub :new, @mock_network, @mock_request do
          client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                               api_key: 'myAPIKey'
          response = client.download_report 'name', 'request_time', 'pdf'
          response.wont_be_nil
        end
      end

      it 'should download report data with parameters' do
        @mock_request = Minitest::Mock.new
        @mock_request.expect(:url, { url: 'arborws/reports/results' },
                             [String])
        @mock_request.expect(:params, api_key: 'myAPIKey')
        @mock_request.expect(:params, name: 'name')
        @mock_request.expect(:params, request_time: 'last')
        @mock_request.expect(:params, format: 'pdf')

        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'
        client.conn.stub :get, nil, @mock_request do
          client.download_report 'name', 'request_time', 'pdf'
          @mock_request.verify
        end
      end
    end
  end
end
