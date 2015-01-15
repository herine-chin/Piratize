require "talk_like_a_pirate"

class PartyRepelledError < StandardError ; end
class NoTreasureError < StandardError ; end
class WhatBeThisError < StandardError ; end

module Ship

  def initialize size, treasure
    @size = size
    @treasure = treasure
    @sunk = false
  end

  def board! boarding_party

    raise "boarding party must be an instance of BoardingParty" unless boarding_party.is_a?(BoardingParty)

    if boarding_party.size <= @size
      raise PartyRepelledError.new
    end

    if @treasure == 0
      raise NoTreasureError.new
    end

    @treasure = 0

  end

end

class ShipWreck

  def initialize ship
    @original_ship = ship
    ship.sink!
  end

end

class Piratize

  def self.process(object)
    if object.is_a? String
      self.translate(object)
    else
    end
  end

  def self.translate(string)
    updated_string = self.remove_words(string)
    p TalkLikeAPirate.translate(updated_string)
  end

  def self.remove_words(string)
    string
  end

end
