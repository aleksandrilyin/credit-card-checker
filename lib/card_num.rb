class CardNum
  attr_writer :card_num

  def initialize(card_num)
    @card_num = card_num.join
  end

  def check_argument
    raise ArgumentError.new('undefined card number') if @card_num.empty?
    raise ArgumentError.new('expected only digits in the card number') if @card_num.match?(/\D/)
    raise ArgumentError.new('unexpected card number length other than 13, 15 or 16 digits') unless @card_num.size.to_s.match?(/13|15|16/)
  end

  def get_begin_digits(i)
    begin_digits = @card_num.split(//)[i]
    i != 0 ? begin_digits.join : begin_digits
  end

  def get_card_type
    cards = [
      {
        card_type: :AMEX,
        begins_with: [34, 37],
        num_length: [15]
      }, {
        card_type: :Discover,
        begins_with: [6011],
        num_length: [16]
      }, {
        card_type: :MasterCard,
        begins_with: [51, 52, 53, 54, 55],
        num_length: [16]
      }, {
        card_type: :Visa,
        begins_with: [4],
        num_length: [13, 16]
      }
    ]

    cards.each do |card|
      if (card[:begins_with].include?(get_begin_digits(0..3).to_i) ||
      card[:begins_with].include?(get_begin_digits(0..1).to_i) ||
      card[:begins_with].include?(get_begin_digits(0).to_i)) &&
      card[:num_length].include?(@card_num.size)
        @@card_type = card[:card_type]
      end
    end

    @@card_type = :Unknown if @@card_type.nil?
    puts "Card Type: #{@@card_type}"
  end

  def get_card_validity
    if @card_num.reverse.split(//).each_slice(2).flat_map{ |a, b| [a.to_i, 2 * b.to_i] }.join.split(//).map(&:to_i).reduce(:+) % 10 == 0
      card_validity = :Valid
    else
      card_validity = :Invalid
    end

    puts "Card Validity: #{card_validity}"
  end
end
