# frozen_string_literal: true

module Reine
  class CheckString
    # Raises an exception when a given argument has a wrong type
    class WrongArgumentTypeError < ::StandardError
      def initialize(arg, klass) = super "#{arg} must be #{klass}"
    end

    attr_writer :dict, :string

    def initialize(string, dict)
      @string = string
      @dict   = dict

      validate!
    end

    def check
      (1..@dict.size)
        .each_with_object([]) { |size, memo| memo << @dict.permutation(size).to_a }
        .flatten(1)
        .map(&:join)
        .any? { |string| string == @string }
    end

    private

    def validate!
      [[:dict, Array], [:string, String]].each do |param|
        variable = instance_variable_get("@#{param.first}")
        raise WrongArgumentTypeError.new(param.first, param.last) unless variable.is_a?(param.last)
      end
    end
  end
end
