class CardNum
  def self.check_argument?
    abort 'Need some argument!' if ARGV[0] == nil
  end

  def self.get_begin_digits i
    first_digit = ARGV.join.split(//)[i]
    i != 0 ? first_digit.join : first_digit
  end

  def self.get_number_length
    ARGV.join.length
  end

  def self.check_luhn_algorithm?
    if ARGV.join.reverse.split(//).each_slice(2).flat_map{|a,b| [a.to_i,2*b.to_i]}.join.split(//).map(&:to_i).reduce(:+)%10==0
      puts 'That card is valid.'
    else
      puts 'That card is not valid.'
    end
  end
end
