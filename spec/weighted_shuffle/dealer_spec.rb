require 'spec_helper'

module WeightedShuffle
  describe Dealer do
    describe '#weighted_shuffle' do

      context 'without factor' do
        [[ [[:a, 1], [:b, 2]], [:a, :b] ],
          [ [[1, 1], [2, 3]], [1, 2] ],
          [ [[1, 1], [2, 0]], [1, 2] ],
          [ [[1, 1], [2, 0], [3, 0]], [1, 2, 3] ],
          [ [[2.0, 1], [:a, 1.5], ['a', 2.3]], [2.0, :a, 'a'] ]]
          .each do |input, output|

          it "returns a permutation of #{output} given #{input}" do
            expect(output.permutation.to_a).to include(
              Dealer.new(input).weighted_shuffle)
          end

          it 'gives correct relative frequency for first position' do
            weights = input.map(&:last)
            # calculate probabiities
            sum = weights.sum
            probabilities = weights.map { |weight| weight.to_f / sum }

            # establish frequencies
            size = 1000
            samples = size.times.map { Dealer.new(input).weighted_shuffle }
            frequencies = input.map(&:first).map do |e|
              samples.select { |s| s.first == e }.count.to_f / size
            end

            # calculate sum of absolute values of differences
            diff = probabilities.zip(frequencies).map { |p,f| (p - f).abs }.sum
            expect(diff).to be < 0.1
          end
        end
      end

      context 'with factor' do

        it 'big factor has a big impact' do
          input = [[1, 1], [2, 1], [3, 1.01]]
          sample = Dealer.new(input).weighted_shuffle factor: 100_000
          expect(sample.first).to eq(3)
        end

        it 'gives expected relative frequency ' do
          input = [[:a, 1], [:b, 2]]
          size = 1000
          samples = size.times.map do
            Dealer.new(input).weighted_shuffle factor: 2
          end
          frequencies = input.map(&:first).map do |e|
            samples.select { |sample| sample.first == e }.count.to_f / size
          end

          diff = [1.0 / 5, 4.0 / 5].zip(frequencies).map { |p, f| (p - f).abs }
            .sum
          expect(diff).to be < 0.1
        end
      end
    end
  end
end
