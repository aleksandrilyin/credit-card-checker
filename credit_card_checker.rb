require_relative 'lib/card_num'

credit_cards = [{
  card_type: 'AMEX',
  begins_with: [34, 37],
  num_length: [15]
}, {
  card_type: 'Discover',
  begins_with: [6011],
  num_length: [16]
}, {
  card_type: 'MasterCard',
  begins_with: [51, 52, 53, 54, 55],
  num_length: [16]
}, {
  card_type: 'Visa',
  begins_with: [4],
  num_length: [13, 16]
}]

CardNum.check_argument

four_digits = CardNum.get_begin_digits 0..3
two_digits = CardNum.get_begin_digits 0..1
one_digit = CardNum.get_begin_digits 0
number_length = CardNum.get_number_length

puts four_digits
puts two_digits
puts one_digit
puts number_length
