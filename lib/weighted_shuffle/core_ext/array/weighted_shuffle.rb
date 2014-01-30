class Array

  def weighted_shuffle(options = {})
    WeightedShuffle::Dealer.new(self).weighted_shuffle options
  end
end
