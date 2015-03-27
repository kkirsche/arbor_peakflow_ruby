require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'arbor_peakflow_ruby'
require 'minitest/autorun'

# ElasticsearchUpdate houses all tests for the
# Elasticsearch Updater and all associated library files
module ArborPeakflowTest
end
