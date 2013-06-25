require 'spec_helper'
require 'weighted_shuffle'

describe WeightedShuffle do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
