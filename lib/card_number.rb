class CardNumber
  CARDS = [
    { card_type: 'AMEX',
      begins_with: %w[34 37],
      number_length: [15] },
    { card_type: 'Discover',
      begins_with: ['6011'],
      number_length: [16] },
    { card_type: 'MasterCard',
      begins_with: %w[51 52 53 54 55],
      number_length: [16] },
    { card_type: 'Visa',
      begins_with: ['4'],
      number_length: [13, 16] }
  ]

  attr_reader :card_number, :card_type

  def initialize(card_number)
    @card_number = card_number.join
    @card_type = 'Unknown'
  end

  def check_argument
    raise ArgumentError.new('undefined card number') if card_number.empty?
    raise ArgumentError.new('expected only digits in the card number') if card_number.match?(/\D/)
    raise ArgumentError.new('unexpected card number length other than 12-19 digits') unless (12..19).include?(card_number.size)
  end

  def get_card_type
    CARDS.each do |card|
      if (card[:begins_with].include?(get_begin_digits(0..3)) ||
      card[:begins_with].include?(get_begin_digits(0..1)) ||
      card[:begins_with].include?(get_begin_digits(0))) &&
      card[:number_length].include?(card_number.size)
        @card_type = card[:card_type]
      end
    end

    card_type
  end

  def get_card_validity
    card_number.reverse.split(//).each_slice(2).flat_map { |a, b| [a.to_i, 2 * b.to_i] }.join.split(//).map(&:to_i).reduce(:+) % 10 == 0 ? 'Valid' : 'Invalid'
  end

  private

  def get_begin_digits(i)
    begin_digits = card_number.split(//)[i]
    i != 0 ? begin_digits.join : begin_digits
  end
end
