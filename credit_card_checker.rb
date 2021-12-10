# frozen_string_literal: true

require_relative "lib/card_number"

begin
  card_number = CardNumber.new(ARGV)
rescue ArgumentError => e
  puts e.message
  exit(1)
end

puts "Card Type: #{card_number.get_card_type}"
puts "Card Validity: #{card_number.get_card_validity}"
