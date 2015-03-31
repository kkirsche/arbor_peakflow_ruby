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
    # - hosts, host, urls, or url: The location of the Arbor Peakflow device cluster.
    # - api_key: The API key to be used when communicating with the Arbor Peakflow API.
    # - ssl_verify: (Optional) Boolean value stating whether you would like to verify the SSL certificates. Defaults to false.
    # - ca_path: (Optional) String value for the location of local certificates. The OPENSSLDIR can be found using the `openssl version -a` command then taking OPENSSLDIR and appending '/certs'. Defaults to the path provided by `openssl version -d`.
    # - ssl_version: (Optional) String value for the version of SSL to use. By default, this is SSLv23, which creates a TLS/SSL connection which may understand the SSLv3, TLSv1, TLSv1.1 and TLSv1.2 protocols.
    #
    # ==== Example
    #
    #    client = Arbor::Peakflow::Client.new host: 'http://my.arbor.device/',
    #                                         api_key: 'myApiKeyHere123',
    #                                         ssl_verify: false,
    #                                         ca_path: '/usr/ssl/certs',
    #                                         ssl_version: 'SSLv23'
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
        @ssl_verify = arguments[:ssl_verify] || \
                      false

        @ca_path = arguments[:ca_path]  || \
                   `openssl version -d`.split(/"/)[1]

        @ssl_version = arguments[:ssl_version]  || \
                       'SSLv23'

        @hosts = arguments[:hosts] || \
                 arguments[:host]  || \
                 arguments[:url]   || \
                 arguments[:urls]  || \
                 ENV.fetch('PEAKFLOW_URL')

        @api_key ||= arguments[:api_key]

        @conn = Faraday.new(@hosts, ssl:
          { verify: @ssl_verify,
            version: @ssl_version,
            ca_path: @ca_path
          }) do |faraday|
          faraday.request :url_encoded
          # faraday.response :logger
          faraday.adapter Faraday.default_adapter
        end
      end

      def url_filter_limit_format_request(url, filter, limit, format)
        response = @conn.get do |req|
          req.url url
          req.params['api_key'] = @api_key
          req.params['format'] = format
          req.params['limit'] = limit unless limit.nil?
          req.params['filter'] = filter unless filter.nil?
        end

        response
      end

      def url_action_filter_request(url, action, filter)
        response = @conn.get do |req|
          req.url url
          req.params['api_key'] = @api_key
          req.params['action'] = action
          req.params['filter'] = filter unless filter.nil?
        end

        response
      end
    end
  end
end
