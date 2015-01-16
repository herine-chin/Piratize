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

module Piratize
  @not_allowed_words = {
    "gold"=> true,
    "treasure"=> true,
    "coin"=> true,
    "coins"=> true
  }

  def self.process(object)
    if block_given?
      self.process(yield (object))
    else
      if object.is_a? String
        self.translate_string(object)
      elsif object.is_a? Array
        self.translate_array(object)
      elsif object.is_a? Hash
        self.translate_hash(object)
      elsif object.is_a? Float
        self.translate_float(object)
      elsif object.is_a? Symbol
        raise WhatBeThisError.new , "'Ere, what be a 'symbol'"
      end
    end
  end

  def self.translate_string(string)
    updated_string = self.remove_words(string)
    TalkLikeAPirate.translate(updated_string)
  end

  def self.remove_words(string)
    words = string.split(" ")
    updated_words = []
    words.each do |word|
      unless @not_allowed_words[word]
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
    (float * 8).floor.to_s + "/8" #not a rational :(
  end

  def process(object)
    Piratize.process(object)
  end

end

class String
  def process
    Piratize.process(self)
  end
end

class Hash
  def process
    Piratize.process(self)
  end
end

class Array
  def process
    Piratize.process(self)
  end
end

class Float
  def process
    Piratize.process(self)
  end
end

