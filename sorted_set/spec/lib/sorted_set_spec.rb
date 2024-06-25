# frozen_string_literal: true

describe Friflex::SortedSet do
  subject(:sorted_set) { described_class.new(3, 3) }

  example('#max')  { expect(sorted_set.max).not_to eq 3 }
  example('#min')  { expect(sorted_set.min).to be >= 0 }
  example('#size') { expect(sorted_set.size).to eq 3 }
  example('#to_s') { expect(sorted_set.to_s.split("\n").size).to eq 3 }

  describe '.new' do
    it 'raises exception when wrong type amount param given' do
      expect { described_class.new('', 5) }.to raise_error Friflex::SortedSet::WrongArgumentTypeError, /amount/
    end

    it 'raises exception when amount param valuse is negative' do
      expect { described_class.new(-1, 5) }.to raise_error Friflex::SortedSet::NegativeOrZeroValueError, /amount/
    end

    it 'raises exception when amount param valuse is zero' do
      expect { described_class.new(0, 5) }.to raise_error Friflex::SortedSet::NegativeOrZeroValueError, /amount/
    end

    it 'raises exception when wrong type limit param given' do
      expect { described_class.new(1, '') }.to raise_error Friflex::SortedSet::WrongArgumentTypeError, /limit/
    end

    it 'raises exception when limit param valuse is negative' do
      expect { described_class.new(2, -5) }.to raise_error Friflex::SortedSet::NegativeOrZeroValueError, /limit/
    end

    it 'raises exception when limit param valuse is zero' do
      expect { described_class.new(2, 0) }.to raise_error Friflex::SortedSet::NegativeOrZeroValueError, /limit/
    end
  end
end
