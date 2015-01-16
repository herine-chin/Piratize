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


# p Piratize.process(:thing)