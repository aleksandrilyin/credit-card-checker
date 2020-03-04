class CardNum
  attr_writer :card_num

  def initialize(card_num)
    @card_num = card_num.join
  end

  def check_argument
    if @card_num.empty?
      abort 'Need some argument!'
    elsif @card_num.match?(/\D/)
      abort 'The card number must contain only digits!'
    elsif not get_number_length.to_s.match?(/13|15|16/)
      abort 'Wrong card number length!'
    end
  end

  def get_begin_digits(i)
    first_digit = @card_num.split(//)[i]
    i != 0 ? first_digit.join : first_digit
  end

  def get_number_length
    @card_num.size
  end

  def check_luhn_algorithm
    if @card_num.reverse.split(//).each_slice(2).flat_map{|a,b| [a.to_i,2*b.to_i]}.join.split(//).map(&:to_i).reduce(:+)%10==0
      puts 'That card is valid.'
    else
      puts 'That card is not valid.'
    end
  end
end
