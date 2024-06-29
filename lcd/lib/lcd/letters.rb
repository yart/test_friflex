# frozen_string_literal: true

module Reine
  class Lcd
    class Letters
      def initialize(letters)       = @letters = letters

      def [](letter)                = @letters[letter]
      def replace_undefined(string) = string.gsub(find_undefined_letters, undefined_letter)

      private

      def undefined_letter          = @letters.keys.first
      def find_undefined_letters    = /[^#{@letters.keys.join}]/
    end
  end
end
