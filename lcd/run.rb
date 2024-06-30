# frozen_string_literal: true

require 'yaml'
require_relative 'lib/lcd'

size    = 2
letters = ARGV.join(' ').upcase
help    = <<~EOHELP
  ruby run.rb [-v <SIZE>] <LETTERS>
      LETTERS  is a string to display, can be [0-9], space, [A-Z]; required param
      -v       is a size of the digital font; optional param
      -h       dispays this help
EOHELP

if ARGV[0] == '-h' || ARGV[0] == '-v' && !ARGV[1].match?(/^\d+$/)
  puts help
  exit 0
end

if ARGV[0] == '-v' && ARGV[1] =~ /^\d+$/
  size = ARGV[1].to_i
  letters = ARGV[2..].join(' ').upcase
end

puts Reine::Lcd.display(letters, size:, font_definition: YAML.load_file('fonts/lines.yaml'))
