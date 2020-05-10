require 'card_num'

describe CardNum do
  subject(:cn) { described_class.new(%w[4408 0412 3456 7893]) }

  describe '#check_argument' do
    context 'when raise ArgumentError' do
      it 'contains empty card number' do
        cn = described_class.new([])
        expect { cn.check_argument }.to raise_error(ArgumentError)
      end

      it 'contains non-digital card number' do
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
end
