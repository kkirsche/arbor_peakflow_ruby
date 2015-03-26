require 'minitest_helper'
module ArborPeakflowTest
  # Test general gem requirements
  class ArborPeakflowClient
    describe 'Client', 'The client used to interact with the Arbor Web Services API' do
      it 'should initialize without error' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        assert_kind_of Arbor::Peakflow::Client, client
        client.wont_be_nil
      end
    end
  end
end
