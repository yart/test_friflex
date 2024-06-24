# frozen_string_literal: true

describe SortedSet do
  subject(:sorted_set) { described_class.new(3, 100) }

  example('#max')  { expect(sorted_set.max).not_to eq 100 }
  example('#min')  { expect(sorted_set.min).to be >= 0 }
  example('#size') { expect(sorted_set.size).to eq 3 }
  example('#to_s') { expect(sorted_set.to_s.split("\n").size).to eq 3 }

  describe '.new' do
    it 'raises exception when wrong type amount param given' do
      expect { described_class.new('', 5) }.to raise_error SortedSet::WrongArgumentTypeError, /amount/
    end

    it 'raises exception when wrong type limit param given' do
      expect { described_class.new(1, '') }.to raise_error SortedSet::WrongArgumentTypeError, /limit/
    end
  end
end
