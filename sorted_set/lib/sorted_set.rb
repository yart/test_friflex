# frozen_string_literal: true

module Friflex
  # Provides a functionallity for sorted set
  class SortedSet < Set
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

      super @set
    end

    def to_s = sort.join("\n")

    private

    def define_set
      set = Set.new
      loop do
        set << rand(@limit)
        break if set.size == @amount
      end
      set
    end

    def validate!
      %i[amount limit].each do |param|
        variable = instance_variable_get("@#{param}")
        raise WrongArgumentTypeError,   param unless variable.is_a?(Integer)
        raise NegativeOrZeroValueError, param unless variable.positive?
      end
    end
  end
end
