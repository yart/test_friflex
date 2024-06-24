# frozen_string_literal: true

# Provides a functionallity for sorted set
class SortedSet
  # Raises when a given argument has a wrong type
  class WrongArgumentTypeError < ::StandardError
    def initialize(arg) = super "#{arg} must be an Integer"
  end

  # @param [Integer] amount
  # @param [Integer] limit
  def initialize(amount, limit)
    raise WrongArgumentTypeError, :amount unless amount.is_a?(Integer)
    raise WrongArgumentTypeError, :limit  unless limit.is_a?(Integer)

    @amount = amount
    @limit  = limit
    @set    = define_set
  end

  def max  = @set[-1]
  def min  = @set[0]
  def size = @set.size
  def to_s = @set.join("\n")

  private

  def define_set
    set = Set.new
    loop do
      set << rand(@limit)
      break if set.size == @amount
    end
    set.to_a.sort
  end
end
