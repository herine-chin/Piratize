require_relative "piratize"

# strings
p Piratize.process("Today is a good day to die")
p Piratize.process("There are lots of gold coins in the treasure chest")

# arrays
p Piratize.process(["apple","this is a sentence","I have coins"])

# hashes
p Piratize.process({"a"=> "value", "b"=> "gold", "coin"=> "coins", "test"=> "Today is a good day to die"})

# floats
p Piratize.process(2.5)
p Piratize.process(0.3)

# passing block
p Piratize.process(11231231231231231232) {|x| x.to_s}
p Piratize.process(["apple","this is a sentence","I have coins"]) {|x| x.map {|element| element.capitalize}}

# as a method in Ruby classes: String, Hash, Array, Float
p "Today is a good day to die".process
test_hash = {"a"=> "value", "b"=> "gold", "coin"=> "coins", "test"=> "Today is a good day to die"}
p test_hash.process
p ["apple","this is a sentence","I have coins"].process
p 0.3.process

# work as a module
class Something
  include Piratize
end

anything = Something.new
p anything.process("Today is a good day to die")

class SomethingAgain
  extend Piratize
end

p SomethingAgain.process("I love coins and lots of gold")

# passing symbol
symbol = :"something"
p Piratize.process(symbol)
