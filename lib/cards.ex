defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
    Provides methods for creating and handling a deck of cards

  """

  @doc """
    Return a list fo strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # cards =
    #   for suit <- suits do
    #     for value <- values do
    #       suit <> " " <> value
    #     end
    #   end
    # Enum.reduce(cards, fn x, acc -> acc ++ x end)
    # List.flatten(cards)

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Example:

      iex> deck = Cards.create_deck
      iex> Cards.contain?(deck, "Ace of Spades")
      true

  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex>  hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def create_hand(hand_size) do
    Cards.create_deck() |> Cards.shuffle() |> Cards.deal(hand_size)
  end
end
