# frozen_string_literal: true

require_relative 'lcd/block'
require_relative 'lcd/char'
require_relative 'lcd/letters'

module Reine
  class Lcd
    def self.display(string, size = 1, object = Letters) = new(string, size, object).send(:display)

    private

    def initialize(string, size, letters)
      @string  = string
      @size    = size
      @letters = letters
    end

    def display
      @chars = []
      output = []

      clear_string.split('').each { |char| @chars << Char.new(blocks: @letters[char], size: @size) }
      @chars.first.height.times { |index| output << build_line(index) }
      output.join("\n")
    end

    def build_line(index)
      line = []

      @chars.each { |char| line << char.lines[index] }
      line.join
    end

    def clear_string
      re = /[^#{@letters.letters.keys.join}]/

      @string.gsub(re, '-')
    end
  end
end
