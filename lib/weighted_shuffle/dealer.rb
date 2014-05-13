require 'active_support/core_ext/enumerable'
require 'bigdecimal'
require 'bigdecimal/util'

module WeightedShuffle
  class Dealer < Struct.new(:array)

    def weighted_shuffle(options = {})
      factor = options.delete(:factor)
      a = Marshal.load Marshal.dump(array)
      unless factor.nil?
        a.map! { |k, v| [k, (v**factor).to_d] }
      end
      sum = a.sum { |k, v| v.to_d || 0.0.to_d }
      b = []
      a.length.times do
        random = SecureRandom.random_number * sum
        a.each_with_index do |(k, v), j|
          if random <= v
            b << a.delete_at(j).first
            sum -= v
            break
          else
            random -= v
          end
        end
      end
      b
    end
  end
end
