# frozen_string_literal: true

module Reine
  class Lcd
    class Char
      def initialize(**opts)
        object  = opts[:block] || Block
        @size   = opts[:size]  || 1
        @blocks = opts[:blocks].map { |row| row.map { |block| object.new(**block.merge(size: @size)) } }
      end

      # @return [Integer]
      def height = block_height * rows

      # @return [Array<String>]
      def lines
        matrix = []
        height.times { |index| matrix << build_line(index) }
        matrix
      end

      private

      def block_height = @blocks.first.first.height
      def rows         = @blocks.size

      def build_line(index)
        line = []
        @blocks[index / block_height].each { |block| line << block.lines[index % block_height] }
        line.join
      end
    end
  end
end
