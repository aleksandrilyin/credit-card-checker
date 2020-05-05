require 'card_num'

describe CardNum do
  subject(:cn1) { described_class.new(%w[4408 0412 3456 7893]) }

  describe '#get_begin_digits' do
    context 'when get begin digits' do
      it 'returns four digits' do
        expect(cn1.get_begin_digits(0..3)).to eq('4408')
      end

      it 'returns two digits' do
        expect(cn1.get_begin_digits(0..1)).to eq('44')
      end

      it 'returns the first digit' do
        expect(cn1.get_begin_digits(0)).to eq('4')
      end
    end
  end
end
