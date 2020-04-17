require_relative 'lib/card_num'

cn = CardNum.new(ARGV)

cn.check_argument

cn.check_card

cn.check_luhn_algorithm
