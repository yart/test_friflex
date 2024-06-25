# frozen_string_literal: true

# Provides a functionallity for sorted set
class SortedSet
  # Raises an exception when a given argument has a wrong type
  class WrongArgumentTypeError < ::StandardError
    def initialize(arg) = super "#{arg} must be an Integer"
  end

  # Raises an exception when a given argument is negative
  class NegativeOrZeroValueError < ::StandardError
    def initialize(arg) = super "#{arg} must be positive"
  end

  # @param [Integer] amount
  # @param [Integer] limit
  def initialize(amount, limit)
    @amount = amount
    @limit  = limit

    validate!

    @set = define_set
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

  def validate!
    %i[amount limit].each do |param|
      variable = instance_variable_get("@#{param}")
      raise WrongArgumentTypeError,   param unless variable.is_a?(Integer)
      raise NegativeOrZeroValueError, param unless variable.positive?
    end
  end
end
