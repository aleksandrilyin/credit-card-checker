require_relative 'lib/credit_card'
require_relative 'lib/card_num'

CardNum.check_argument

four_digits = CardNum.get_begin_digits 0..3
two_digits = CardNum.get_begin_digits 0..1
one_digit = CardNum.get_begin_digits 0
number_length = CardNum.get_number_length

puts four_digits
puts two_digits
puts one_digit
puts number_length
