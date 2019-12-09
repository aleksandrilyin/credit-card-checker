class CreditCard
  credit_cards = [{
      card_type: 'AMEX',
      begins_with: [34, 37],
      num_length: [15]
    }, {
      card_type: 'Discover',
      begins_with: [6011],
      num_length: [16]
    }, {
      card_type: 'MasterCard',
      begins_with: [51, 52, 53, 54, 55],
      num_length: [16]
    }, {
      card_type: 'Visa',
      begins_with: [4],
      num_length: [13, 16]
    }]
end
