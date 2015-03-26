require 'minitest_helper'
module ArborPeakflowTest
  # Test general gem requirements
  class ArborPeakflow
    describe 'ArborPeakflowRuby', 'General gem tests' do
      it 'should have a version number' do
        Arbor::Peakflow::VERSION.wont_be_nil
      end
    end
  end
end
