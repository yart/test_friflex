# frozen_string_literal: true

module Reine
  class Lcd
    class Block
      def initialize(**opts)
        @horizontal_border = opts[:horizontal] || '—'
        @vertical_border   = opts[:vertical]   || '|'
        @corner_border     = opts[:corner]     || ' '
        @center            = opts[:center]     || ' '
        @size              = opts[:size]       || 1
      end

      # @return [Integer]
      def height = 1 + @size

      # @return [Array<String>]
      def lines
        block = [build_line(@corner_border, @horizontal_border)]
        @size.times { block << build_line(@vertical_border, @center) }
        block
      end

      private

      def build_line(starter, repetitor) = "#{starter}#{repetitor * @size}"
    end
  end
end
