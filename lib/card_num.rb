class CardNum
  attr_accessor :card_num

  def initialize(card_num)
    @card_num = card_num
  end

  def check_argument
    abort 'Need some argument!' if @card_num[0] == nil
  end

  def get_begin_digits(i)
    first_digit = @card_num.join.split(//)[i]
    i != 0 ? first_digit.join : first_digit
  end

  def get_number_length
    @card_num.join.length
  end

  def check_luhn_algorithm
    if @card_num.join.reverse.split(//).each_slice(2).flat_map{|a,b| [a.to_i,2*b.to_i]}.join.split(//).map(&:to_i).reduce(:+)%10==0
      puts 'That card is valid.'
    else
      puts 'That card is not valid.'
    end
  end
end
