require_relative 'lib/card_num'

cn = CardNum.new(ARGV)

cn.check_argument

puts "Card Type: #{cn.get_card_type}"
puts "Card Validity: #{cn.get_card_validity}"
