# frozen_string_literal: true

describe Reine::Lcd::Block do
  let(:block_params)  { { horizontal: '_', vertical: '/', corner: '.', center: ':', size: 2 } }
  let(:block_example) { described_class.new(**block_params) }

  example('#height') { expect(block_example.height).to eq 3 }
  example('#lines')  { expect(block_example.lines).to  eq ['.__', '/::', '/::'] }
end
