require 'weighted_shuffle/core_ext/array/weighted_shuffle'

describe '#weighted_shuffle' do
  it 'responds to weighted_shuffle' do
    Array.new.should respond_to(:weighted_shuffle)
  end
end
