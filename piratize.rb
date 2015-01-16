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
      self.translate_string(object)
    elsif object.is_a? Array
      self.translate_array(object)
    elsif object.is_a? Hash
      self.translate_hash(object)
    elsif object.is_a? Float
      self.translate_float(object)
    else
      yield (object)
    end
  end

  def self.translate_string(string)
    updated_string = self.remove_words(string)
    TalkLikeAPirate.translate(updated_string)
  end

  def self.remove_words(string)
    not_allowed_words = {
      "gold"=> true,
      "treasure"=> true,
      "coin"=> true,
      "coins"=> true
    }

    words = string.split(" ")
    updated_words = []
    words.each do |word|
      unless not_allowed_words[word]
        updated_words.push(word)
      end
    end
    updated_words.join(" ")
  end

  def self.translate_array(array)
    translated_array = []
    array.each do |element|
      translated_array.push(self.process(element))
    end
    translated_array
  end

  def self.translate_hash(hash)
    updated_hash = {}
    hash.each do |key, value|
      updated_hash[key] = self.process(value)
    end
    updated_hash
  end

  def self.translate_float(float)
    (float * 8).floor.to_s + "/8"
  end

end
