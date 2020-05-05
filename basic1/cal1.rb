def div(len)

	puts "-" * len

	print "\n"

end

def cal(num1, num2, op)

	puts "num1 #{ op } num2 = #{ num1.send(op, num2) }"

end

def prompt(i)

	return "Please enter number #{ i } = "

end


title = "Calculator"

puts title

div(title.length)


pro = prompt(1)

print pro

num1 = (gets.chomp).to_f

div(pro.length)


pro = prompt(2)

print pro

num2 = (gets.chomp).to_f

div(pro.length)


head = "Number 1 = #{ num1 } | Number 2 = #{ num2 }"

puts head

div(head.length)


cal(num1, num2, :+)

cal(num1, num2, :-)

cal(num1, num2, :*)

cal(num1, num2, :/)

cal(num1, num2, :%)


cal(num1, num2, :==)

cal(num1, num2, :<)

cal(num1, num2, :>)

cal(num1, num2, :!=)

cal(num1, num2, :>=)

cal(num1, num2, :<=)

