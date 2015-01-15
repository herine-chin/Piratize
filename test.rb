require_relative "piratize"

# string
p Piratize.process("Today is a good day to die")
p Piratize.process("There are lots of gold coins in the treasure chest")

# arrays
p Piratize.process(["apple","this is a sentence","I have coins"])

# hashes
p Piratize.process({"a"=> "value", "b"=> "gold", "coin"=> "coins"})

p Piratize.process(:thing)