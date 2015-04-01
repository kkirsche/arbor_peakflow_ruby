require 'minitest_helper'

module ArborPeakflowTest
  # Test the alerts actions
  class ArborPeakflowClient
    describe 'Traffic', 'The Arbor Web Services API tms port options' do
      it 'should retrieve JSON TMS traffic data' do
        client = Arbor::Peakflow::Client.new host: 'http://test.host.com',
                                             api_key: 'myAPIKey'

        client.client.connection = Hurley::Test.new do |test|
          test.get '/arborws/traffic' do
            [200, { 'Content-Type' => 'application/json' }, %({"id": 1})]
          end
        end

        query_data = %(
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

        response = client.traffic query_data
        response.wont_be_nil
      end
    end
  end
end
