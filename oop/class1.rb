class Point

@x
@y

def initialize(x, y)
	@x = x
	@y = y
end

def x=(x)
	@x = x
end

def x
	return @x
end

def y=(y)
	@y = y
end

def y 
	return @y
end

def to_s
	print "(#{@x}, #{@y})"
end

end


class Line
attr_accessor :p1
attr_reader :p2

@p1
@p2

def initialize(p1, p2)
	@p1 = p1
	@p2 = p2
end

def draw
	puts "Line start: (#{@p1.x}, #{@p1.y})"
	puts "Line end: (#{@p2.x}, #{@p2.y})"
end

end


p1 = Point.new(10, 10)
p2 = Point.new(20, 20)

puts p1
puts p2


l1 = Line.new(p1, p2)

puts l1

l1.draw
