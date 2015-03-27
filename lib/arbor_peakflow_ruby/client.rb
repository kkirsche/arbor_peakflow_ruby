require 'arbor_peakflow_ruby/actions/alerts'
require 'arbor_peakflow_ruby/actions/cp5500'
require 'arbor_peakflow_ruby/actions/managed_object'
require 'arbor_peakflow_ruby/actions/mitigations'
require 'arbor_peakflow_ruby/actions/reports'
require 'arbor_peakflow_ruby/actions/routers'
require 'arbor_peakflow_ruby/actions/tms_appliance'
require 'arbor_peakflow_ruby/actions/tms_ports'
require 'arbor_peakflow_ruby/actions/traffic'
require 'faraday'
require 'json'

module Arbor
  module Peakflow
    # == Client
    # The Arbor Peakflow client in charge of using Faraday to communicate with
    # the Arbor devices.
    #
    # == Parameters
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
      include Arbor::Peakflow::Alerts
      include Arbor::Peakflow::CP5500
      include Arbor::Peakflow::Managed_Object
      include Arbor::Peakflow::Mitigations
      include Arbor::Peakflow::Reports
      include Arbor::Peakflow::Routers
      include Arbor::Peakflow::TMS_Appliance
      include Arbor::Peakflow::TMS_Ports
      include Arbor::Peakflow::Traffic

      attr_reader :hosts, :api_key, :conn
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
