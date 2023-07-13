defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
    # "Hi There!"
  end

  @doc """
  Returns a list of strings representing a deck of cards
  """
  def create_deck do
    # ["Ace", "Two", "Three"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Diamonds", "Spades", "Flowers", "Hearts"]

    # Solution #1
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    # Solution #2
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

    ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    # Enum.member?(deck, hand)
    card in deck
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck
    The `hand_size` argument indicates how many cards should be in the hand.

    ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    # Calling 3 methods, create, shuffle and deal
    # Solution 1
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # Solution 2 using Pipe Operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
