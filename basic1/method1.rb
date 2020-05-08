num1 = 10

num2 = 2


head = "num1 = #{ num1 } | num2 = #{ num2 }"

puts head

puts "-" * head.length


def cal(num1, num2, op)

	puts "num1 #{ op } num2 = #{ num1.send(op, num2) }"

end

cal(num1, num2, :+)

cal(num1, num2, :-)

cal(num1, num2, :*)

cal(num1, num2, :/)



cal(num1, num2, :==)

cal(num1, num2, :<)

cal(num1, num2, :>)

cal(num1, num2, :!=)

cal(num1, num2, :>=)

cal(num1, num2, :<=)


def sample (*test)
   puts "The number of parameters is #{test.length}"
   for i in 0...test.length
      puts "The parameters are #{test[i]}"
   end
end

sample "Zara", "6", "F"
sample "Mac", "36", "M", "MCA"


