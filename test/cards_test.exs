defmodule CardsTest do
  use ExUnit.Case
  # doctest Cards

  test "create_deck make 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
    # assert Cards.create_deck == [
    #          "Ace of Spades",
    #          "Ace of Clubs",
    #          "Ace of Hearts",
    #          "Ace of Diamonds",
    #          "Two of Spades",
    #          "Two of Clubs",
    #          "Two of Hearts",
    #          "Two of Diamonds",
    #          "Three of Spades",
    #          "Three of Clubs",
    #          "Three of Hearts",
    #          "Three of Diamonds",
    #          "Four of Spades",
    #          "Four of Clubs",
    #          "Four of Hearts",
    #          "Four of Diamonds",
    #          "Five of Spades",
    #          "Five of Clubs",
    #          "Five of Hearts",
    #          "Five of Diamonds"
    #        ]
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
  end

  test "greets the world" do
    assert 1 + 1 == 2
  end
end
