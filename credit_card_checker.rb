require_relative 'lib/card_num'

credit_cards = {
  # card_type: [[begins_with], [num_length]],
  AMEX: [[34, 37], [15]],
  Discover: [[6011], [16]],
  MasterCard: [[51, 52, 53, 54, 55], [16]],
  Visa: [[4], [13, 16]]
}

CardNum.check_argument

four_digits = CardNum.get_begin_digits 0..3
two_digits = CardNum.get_begin_digits 0..1
one_digit = CardNum.get_begin_digits 0
number_length = CardNum.get_number_length

puts four_digits
puts two_digits
puts one_digit
puts number_length
