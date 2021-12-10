# frozen_string_literal: true

require_relative "lib/card_number"

card_number = CardNumber.new(ARGV)

puts "Card Type: #{card_number.get_card_type}"
puts "Card Validity: #{card_number.get_card_validity}"
