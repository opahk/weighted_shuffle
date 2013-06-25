# Weighted Shuffle

[![Build Status](https://travis-ci.org/opahk/weighted_shuffle.png?branch=master)](https://travis-ci.org/opahk/weighted_shuffle)
[![Coverage Status](https://coveralls.io/repos/opahk/weighted_shuffle/badge.png)](https://coveralls.io/r/opahk/weighted_shuffle)
[![Code Climate](https://codeclimate.com/github/opahk/weighted_shuffle.png)](https://codeclimate.com/github/opahk/weighted_shuffle)

An extension to the Fisher-Yates-Shuffle algorithm to support weights. It
includes a ruby core extension convenience of arrays.

## Installation

Add this line to your application's Gemfile:

    gem 'weighted_shuffle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weighted_shuffle

## Usage

standalone usage:

    array = [[:a, 1], [:b, 2]] # 1, 2 are weights
    dealer = WeightedShuffle::Dealer.new array

    dealer.weighted_shuffle
    => [:b, :a]

integrated into ruby Array:

    require 'weighted_shuffle/core_ext/array/weighted_shuffle'

    array = [[:a, 1], [:b, 2]]
    array.weighted_shuffle
    => [:b, :a]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
