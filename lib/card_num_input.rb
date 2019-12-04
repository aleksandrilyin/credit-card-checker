module CardNumInput
  def self.check_argument
    if ARGV[0] == nil
      abort 'Need some argument!'
    end
  end

  def self.get_begin_digit i
    i != 0 ? ARGV.join.split(//)[i].join : ARGV.join.split(//)[i]
  end

  def self.get_number_length
    ARGV.join.length
  end
end
