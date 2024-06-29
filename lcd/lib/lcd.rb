# frozen_string_literal: true

require_relative 'lcd/block'
require_relative 'lcd/char'
require_relative 'lcd/letters'

module Reine
  class Lcd
    class FontDefinitionError < ::StandardError
    end

    def self.display(string, size: 1, font_builder: Letters, font_definition: nil, char_builder: Char)
      raise FontDefinitionError, 'Param `font_definition` cannot be `nil`.' if font_definition.nil?

      new(string:, size:, font_builder:, font_definition:, char_builder:).send(:display)
    end

    private

    def initialize(**opts)
      @string = opts[:string]
      @size   = opts[:size]
      @font   = opts[:font_builder].new(opts[:font_definition])
      @char   = opts[:char_builder]
    end

    def display
      @chars = []
      output = []

      @font.replace_undefined(@string).split('').each { |char| @chars << @char.new(blocks: @font[char], size: @size) }
      @chars.first.height.times { |index| output << build_line(index) }
      output.join("\n")
    end

    def build_line(index)
      line = []

      @chars.each { |char| line << char.lines[index] }
      line.join
    end
  end
end
