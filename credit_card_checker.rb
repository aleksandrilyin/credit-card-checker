require_relative 'lib/card_num'

cn = CardNum.new(ARGV)

cn.check_argument

cn.get_card_type

cn.get_card_validity
