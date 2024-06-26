# frozen_string_literal: true

describe Reine::CheckString do
  describe '.new' do
    it 'raises exception when wrong type string param given' do
      expect { described_class.new(5, []) }.to raise_error Reine::CheckString::WrongArgumentTypeError, /string.+String/
    end

    it 'raises exception when string param value is nil' do
      expect { described_class.new(nil, []) }.to raise_error Reine::CheckString::WrongArgumentTypeError, /string.+String/
    end

    it 'raises exception when wrong type dict param given' do
      expect { described_class.new('', 1) }.to raise_error Reine::CheckString::WrongArgumentTypeError, /dict.+Array/
    end

    it 'raises exception when dict param value is nil' do
      expect { described_class.new('', nil) }.to raise_error Reine::CheckString::WrongArgumentTypeError, /dict.+Array/
    end
  end

  describe '#check' do
    let(:correct_example) { described_class.new('двесотни', %w[две сотни тысячи]) }
    let(:wrong_example)   { described_class.new('трисотни', %w[две сотни тысячи]) }

    it 'returns true when found string in dict' do
      expect(correct_example.check).to be_truthy
    end

    it 'returns false when can not find string in dict' do
      expect(wrong_example.check).to be_falsy
    end
  end
end
