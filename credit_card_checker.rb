require_relative 'lib/credit_card'
require_relative 'lib/card_num_input'

CardNumInput.check_argument

four_digits = CardNumInput.get_begin_digit 0..3
two_digits = CardNumInput.get_begin_digit 0..1
one_digit = CardNumInput.get_begin_digit 0
number_length = CardNumInput.get_number_length

puts four_digits
puts two_digits
puts one_digit
puts number_length
