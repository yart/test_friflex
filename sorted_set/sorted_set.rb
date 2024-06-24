# frozen_string_literal: true

require_relative 'lib/sorted_set'

help = <<~EOHELP
  ruby sorted_set.rb <AMOUNT> <LIMIT>
      AMOUNT   is a maximum amount of sorted set valuses, required param
      LIMIT    is an excluded upper limit of sorted set value, required param
EOHELP

puts help if ARGV.size < 2 || ARGV.size > 2

puts SortedSet.new(ARGV[0].to_i, ARGV[1].to_i)
