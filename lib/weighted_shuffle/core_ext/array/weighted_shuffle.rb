class Array

  def weighted_shuffle
    WeightedShuffle::Dealer.new(self).weighted_shuffle
  end
end
