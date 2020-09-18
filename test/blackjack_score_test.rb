require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do

    # Arrange
    hand = [2, 4, 'Jack' ]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 16

  end

  it 'calculates aces as 11 where it does not go over 21' do

    #Arrange
    hands = ['Ace', 4, 5]

    # Act
    score = blackjack_score(hands)


    # Assert
    expect(score).must_equal 20
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    #Arrange
    hand = ['Ace', 2, 'King']
    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13

  end


  it 'raises an ArgumentError for invalid cards' do


    expect{
      blackjack_score([1, 'King'])
    }.must_raise ArgumentError

    # Incorrect use of decimal number
    expect{
      blackjack_score([2, 'Joker'])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    expect{
      blackjack_score(['Jack', 5, 'King'])
    }.must_raise ArgumentError

    expect{
      blackjack_score([4, 'Queen', 9])
    }.must_raise ArgumentError

  end

  # it 'raises and ArgumentError for more than 5 cards in hand' do
  #   # Incorrect amount of cards in hand
  #   expect{
  #     blackjack_score([2, 3, 4, 5, 9, "Ace"])
  #   }.must_raise ArgumentError
  #
  #   expect{
  #     blackjack_score(['2'])
  #   }.must_raise ArgumentError
  # end

end
