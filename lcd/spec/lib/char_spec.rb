# frozen_string_literal: true

describe Reine::Lcd::Char do
  # ......
  # :    : First line: two blocks
  # :| | :
  # : —  : Second line: two blocks
  # :  | :
  # :    : Third line: two blocks
  # ......
  #
  # One full filled block:
  #  ....
  #  :.—:
  #  :| :
  #  :..:
  #
  # corner:   '.', horizontal: '—'
  # vertical: '|', center:     ' '
  #
  # Two full filled blocks in one line:
  #  ......
  #  :.—.—:
  #  :| | :
  #  :....:
  #
  # Four full filled blocks in two lines:
  #  ......
  #  :.—.—:
  #  :| | :
  #  :.—.—:
  #  :| | :
  #  :....:
  #
  # The minimal count of blocks to make one char is 6: three lines by two blocks

  let(:blocks) do
    [
      [
        { corner: ' ',  horizontal: ' ',  vertical: '|', center: ' ' },
        { corner: ' ',  horizontal: ' ',  vertical: '|', center: ' ' }
      ],
      [
        { corner: ' ',  horizontal: '—',  vertical: ' ', center: ' ' },
        { corner: ' ',  horizontal: ' ',  vertical: '|', center: ' ' }
      ],
      [
        { corner: ' ',  horizontal: ' ',  vertical: ' ', center: ' ' },
        { corner: ' ',  horizontal: ' ',  vertical: ' ', center: ' ' }
      ]
    ]
  end
  let(:char_example) { described_class.new(blocks:, size: 1, block: Reine::Lcd::Block) }

  example('#height') { expect(char_example.height).to eq 6 }
  example('#lines')  { expect(char_example.lines).to  eq ['    ', '| | ', ' —  ', '  | ', '    ', '    '] }
end
