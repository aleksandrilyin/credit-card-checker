require_relative '../lib/card_number'

RSpec.describe CardNumber do
  subject(:card_number) { described_class.new(%w[4408 0412 3456 7893]) }

  describe '#check_argument' do
    context 'when raise ArgumentError' do
      it 'contains empty card number' do
        card_number = described_class.new([])
        expect { card_number.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains non-digit in the card number' do
        card_number = described_class.new(%w[4408 0412 3456 789a])
        expect { card_number.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains card number length less 12 digits' do
        card_number = described_class.new(%w[4408 0412 345])
        expect { card_number.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains card number length more 19 digits' do
        card_number = described_class.new(%w[4408 0412 3456 7893 0000])
        expect { card_number.check_argument }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#get_card_type' do
    context 'when get Card Type' do
      it 'returns AMEX (Begins With: 34)' do
        card_number = described_class.new(%w[3408 0412 3456 789])
        expect(card_number.get_card_type).to eq('AMEX')
      end

      it 'returns AMEX (Begins With: 37)' do
        card_number = described_class.new(%w[3708 0412 3456 789])
        expect(card_number.get_card_type).to eq('AMEX')
      end

      it 'returns Discover' do
        card_number = described_class.new(%w[6011 0412 3456 7893])
        expect(card_number.get_card_type).to eq('Discover')
      end

      it 'returns MasterCard (Begins With: 51)' do
        card_number = described_class.new(%w[5108 0412 3456 7893])
        expect(card_number.get_card_type).to eq('MasterCard')
      end

      it 'returns MasterCard (Begins With: 52)' do
        card_number = described_class.new(%w[5208 0412 3456 7893])
        expect(card_number.get_card_type).to eq('MasterCard')
      end

      it 'returns MasterCard (Begins With: 53)' do
        card_number = described_class.new(%w[5308 0412 3456 7893])
        expect(card_number.get_card_type).to eq('MasterCard')
      end

      it 'returns MasterCard (Begins With: 54)' do
        card_number = described_class.new(%w[5408 0412 3456 7893])
        expect(card_number.get_card_type).to eq('MasterCard')
      end

      it 'returns MasterCard (Begins With: 55)' do
        card_number = described_class.new(%w[5508 0412 3456 7893])
        expect(card_number.get_card_type).to eq('MasterCard')
      end

      it 'returns Visa (Number Length: 13)' do
        card_number = described_class.new(%w[4408 0412 3456 7])
        expect(card_number.get_card_type).to eq('Visa')
      end

      it 'returns Visa (Number Length: 16)' do
        expect(card_number.get_card_type).to eq('Visa')
      end

      it 'returns Visa (Argument: without spaces)' do
        card_number = described_class.new(%w[4408041234567893])
        expect(card_number.get_card_type).to eq('Visa')
      end

      it 'returns Visa (Argument: with spaces)' do
        card_number = described_class.new(%w[4 4 0 8 0412 3456 7893])
        expect(card_number.get_card_type).to eq('Visa')
      end

      it 'returns Unknown' do
        card_number = described_class.new(%w[0408 0412 3456 7893])
        expect(card_number.get_card_type).to eq('Unknown')
      end
    end
  end

  describe '#get_card_validity' do
    context 'when get Card Validity' do
      it 'returns Valid' do
        expect(card_number.get_card_validity).to eq('Valid')
      end

      it 'returns Invalid' do
        card_number = described_class.new(%w[4417 1234 5678 9112])
        expect(card_number.get_card_validity).to eq('Invalid')
      end
    end
  end
end
