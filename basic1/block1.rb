def test
   puts "You are in the method"
   yield
   puts "You are again back to the method"
   yield
end

test {puts "You are in the block"}


def test
   yield 5
   puts "You are in the method test"
   yield 100
end

test {|i| puts "You are in the block #{i}"}


def test(&block)
   block.call
end

test { puts "Hello World!"}



























