require_relative 'lib/card_number'

card_number = CardNumber.new(ARGV)

card_number.check_argument

puts 'Card Type: ' + card_number.get_card_type
puts 'Card Validity: ' + card_number.get_card_validity
