require_relative 'lib/card_num'

credit_cards = [{
  card_type: :AMEX,
  begins_with: [34, 37],
  num_length: [15]
}, {
  card_type: :Discover,
  begins_with: [6011],
  num_length: [16]
}, {
  card_type: :MasterCard,
  begins_with: [51, 52, 53, 54, 55],
  num_length: [16]
}, {
  card_type: :Visa,
  begins_with: [4],
  num_length: [13, 16]
}]

cn = CardNum.new(ARGV)

cn.check_argument

four_digits = cn.get_begin_digits(0..3)
two_digits = cn.get_begin_digits(0..1)
one_digit = cn.get_begin_digits(0)
num_length = cn.get_num_length

credit_cards.each do |credit_card|
  if (credit_card[:begins_with].include?(four_digits.to_i) ||
  credit_card[:begins_with].include?(two_digits.to_i) ||
  credit_card[:begins_with].include?(one_digit.to_i)) &&
  credit_card[:num_length].include?(num_length)
    @card_type = credit_card[:card_type]
    puts "Card type: #{@card_type}."
  end
end
puts 'Card type: Unknown.' if @card_type.nil?

cn.check_luhn_algorithm
