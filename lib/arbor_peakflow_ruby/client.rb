require 'faraday'
module Arbor
  module Peakflow
    # == Client
    # The Arbor Peakflow client in charge of using Faraday to communicate with
    # the Arbor devices.
    #
    #  == Parameters
    # - hosts, host, urls, or url: The location of the Arbor Peakflow
    # device cluster
    # - api_key: The API key to be used when communicating with the Arbor
    # Peakflow API.
    #
    # ==== Example
    #
    #    client = Arbor::Peaklfow::Client.new host: 'http://my.arbor.device/'
    #                                         api_key: 'myApiKeyHere123'
    class Client
      def initialize(arguments = {})
        @hosts = arguments[:hosts] || \
                 arguments[:host]  || \
                 arguments[:url]   || \
                 arguments[:urls]  || \
                 ENV.fetch('PEAKFLOW_URL')

        @api_key ||= arguments[:api_key]

        @conn = Faraday.new(@hosts, ssl: { verify: false }) do |faraday|
          faraday.request :url_encoded
          # faraday.response :logger
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end