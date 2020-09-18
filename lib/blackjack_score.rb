# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0
  extra_ten = 0
  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("Invalid card value.")
    elsif hand.length > 5 || hand.length < 2
      raise ArgumentError.new("The hand must contain 2 to 5 cards.")
    end

    if card == 'Jack' || card == 'Queen'|| card == 'King'
      card = 10
    elsif card == 'Ace'
      card = 1
      extra_ten += 10
    end

    score = score + card
  end

  if score > 21
    raise ArgumentError.new("Game over!")
  elsif score < 12 && extra_ten > 0
    score = score + 10
  end
  return score

end






