require 'minitest_helper'
module ArborPeakflowTest
  # Test the Arbor Peakflow API Client
  class ArborPeakflowClient
    describe 'Client', 'The client used to interact with the Arbor Web Services API' do
      it 'should initialize without error' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        assert_kind_of Arbor::Peakflow::Client, client
        client.wont_be_nil
      end

      it 'should set the API key' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        expect(client.api_key).must_equal 'myAPIKey'
      end

      it 'should set the host' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        expect(client.hosts).must_equal 'http://test.host.com'

        client = Arbor::Peakflow::Client.new hosts: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        expect(client.hosts).must_equal 'http://test.host.com'

        client = Arbor::Peakflow::Client.new url: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        expect(client.hosts).must_equal 'http://test.host.com'

        client = Arbor::Peakflow::Client.new urls: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        expect(client.hosts).must_equal 'http://test.host.com'
      end
    end
  end
end
