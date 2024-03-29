# frozen_string_literal: true

class CardNumber
  CARDS = [
    {
      card_type: "AMEX",
      begins_with: %w[34 37],
      number_length: [15]
    },
    {
      card_type: "Discover",
      begins_with: %w[6011],
      number_length: [16]
    },
    {
      card_type: "MasterCard",
      begins_with: %w[51 52 53 54 55],
      number_length: [16]
    },
    {
      card_type: "Visa",
      begins_with: %w[4],
      number_length: [13, 16]
    }
  ].freeze

  attr_reader :card_number, :card_type

  def initialize(card_number)
    @card_number = if card_number.empty?
      raise ArgumentError, "Undefined card number"
    elsif card_number.join.match?(/\D/)
      raise ArgumentError, "Expected only digits in the card number"
    elsif !(12..19).cover?(card_number.join.size)
      raise ArgumentError, "Unexpected card number length other than 12-19 digits"
    else
      card_number.join
    end
    @card_type = "Unknown"
  end

  def get_card_type
    CARDS.each do |card|
      if (card[:begins_with].include?(get_begin_digits(0..3)) ||
          card[:begins_with].include?(get_begin_digits(0..1)) ||
          card[:begins_with].include?(get_begin_digits(0))) &&
          card[:number_length].include?(card_number.size)
        @card_type = card[:card_type]
      end
    end

    card_type
  end

  def get_card_validity
    card_number.reverse.chars.each_slice(2).flat_map { |a, b| [a.to_i, 2 * b.to_i] }.join.chars.map(&:to_i).reduce(:+) % 10 == 0 ? "Valid" : "Invalid"
  end

  private

  def get_begin_digits(i)
    card_number[i]
  end
end
