class CardNum
  def self.check_argument
    abort 'Need some argument!' if ARGV[0] == nil
  end

  def self.get_begin_digits i
    first_digit = ARGV.join.split(//)[i]
    i != 0 ? first_digit.join : first_digit
  end

  def self.get_number_length
    ARGV.join.length
  end

  def check_luhn_algorithm?
    ARGV.join.reverse.split(//).each_slice(2).flat_map{|a,b| [a.to_i,2*b.to_i]}.join.split(//).map(&:to_i).reduce(:+)%10==0
  end
end
