class CardNum
  attr_writer :card_num

  def initialize(card_num)
    @card_num = card_num.join
  end

  def check_argument
    raise ArgumentError.new('undefined card number') if @card_num.empty?
    raise ArgumentError.new('expected only digits in the card number') if @card_num.match?(/\D/)
    raise ArgumentError.new('unexpected card number length other than 13, 15 or 16 digits') unless get_num_length.to_s.match?(/13|15|16/)
  end

  def get_begin_digits(i)
    first_digits = @card_num.split(//)[i]
    i != 0 ? first_digits.join : first_digits
  end

  def get_num_length
    @card_num.size
  end

  def check_luhn_algorithm
    if @card_num.reverse.split(//).each_slice(2).flat_map{ |a, b| [a.to_i, 2 * b.to_i] }.join.split(//).map(&:to_i).reduce(:+) % 10 == 0
      puts 'That card is valid.'
    else
      puts 'That card is not valid.'
    end
  end
end
