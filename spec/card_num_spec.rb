require 'card_num'

RSpec.describe CardNum do
  subject(:cn) { described_class.new(%w[4408 0412 3456 7893]) }

  describe '#check_argument' do
    context 'when raise ArgumentError' do
      it 'contains empty card number' do
        cn = described_class.new([])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains non-digit in the card number' do
        cn = described_class.new(%w[4408 0412 3456 789a])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains card number length less 13 digits' do
        cn = described_class.new(%w[4408 0412 3456])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains card number length 14 digits' do
        cn = described_class.new(%w[4408 0412 3456 78])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains card number length more 16 digits' do
        cn = described_class.new(%w[4408 0412 3456 7893 0])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#get_begin_digits' do
    context 'when get begin digits' do
      it 'returns four digits' do
        expect(cn.get_begin_digits(0..3)).to eq('4408')
      end

      it 'returns two digits' do
        expect(cn.get_begin_digits(0..1)).to eq('44')
      end

      it 'returns the first digit' do
        expect(cn.get_begin_digits(0)).to eq('4')
      end
    end
  end

  describe '#get_card_type' do
    context 'when get Card Type' do
      it 'returns AMEX (Begins With: 34)' do
        cn = described_class.new(%w[3408 0412 3456 789])
        expect(cn.get_card_type).to eq(:AMEX)
      end

      it 'returns AMEX (Begins With: 37)' do
        cn = described_class.new(%w[3708 0412 3456 789])
        expect(cn.get_card_type).to eq(:AMEX)
      end

      it 'returns Discover' do
        cn = described_class.new(%w[6011 0412 3456 7893])
        expect(cn.get_card_type).to eq(:Discover)
      end

      it 'returns MasterCard (Begins With: 51)' do
        cn = described_class.new(%w[5108 0412 3456 7893])
        expect(cn.get_card_type).to eq(:MasterCard)
      end

      it 'returns MasterCard (Begins With: 52)' do
        cn = described_class.new(%w[5208 0412 3456 7893])
        expect(cn.get_card_type).to eq(:MasterCard)
      end

      it 'returns MasterCard (Begins With: 53)' do
        cn = described_class.new(%w[5308 0412 3456 7893])
        expect(cn.get_card_type).to eq(:MasterCard)
      end

      it 'returns MasterCard (Begins With: 54)' do
        cn = described_class.new(%w[5408 0412 3456 7893])
        expect(cn.get_card_type).to eq(:MasterCard)
      end

      it 'returns MasterCard (Begins With: 55)' do
        cn = described_class.new(%w[5508 0412 3456 7893])
        expect(cn.get_card_type).to eq(:MasterCard)
      end

      it 'returns Visa (Number Length: 13)' do
        cn = described_class.new(%w[4408 0412 3456 7])
        expect(cn.get_card_type).to eq(:Visa)
      end

      it 'returns Visa (Number Length: 16)' do
        expect(cn.get_card_type).to eq(:Visa)
      end

      it 'returns Unknown' do
        cn = described_class.new(%w[0408 0412 3456 7893])
        expect(cn.get_card_type).to eq(:Unknown)
      end
    end
  end

  describe '#get_card_validity' do
    context 'when get Card Validity' do
      it 'returns Valid' do
        expect(cn.get_card_validity).to eq(:Valid)
      end

      it 'returns Invalid' do
        cn = described_class.new(%w[4417 1234 5678 9112])
        expect(cn.get_card_validity).to eq(:Invalid)
      end
    end
  end
end
