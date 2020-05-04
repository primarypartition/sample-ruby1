# Calculator

# New line 
def nl(n)

	print "\n" * n

end

# Line divider
def div(len)

	puts "-" * len

	nl(1)

end

# Basic math operation
def cal(num1, num2, op)

	return "Number 1 #{ op } Number 2 = #{ num1.send(op, num2) }"

end

# Input prompt
def prompt(i)

	return "Please enter number #{ i } = "

end

# Get operator symbol
def getOperator(op)

	if op == "+"
		return :+	
	elsif op == "-" 
		return :- 
	elsif op == "*" 
		return :*
	elsif op == "/"
		return :/
	elsif op == "%"
		return :%
	end

end


# Program header

nl(2)

main_title = "Calculator"

puts main_title

div(main_title.length)


# Input 1

pro1 = prompt(1)

print pro1

num1 = (gets.chomp).to_f

div(pro1.length)


# Input 2

pro2 = prompt(2)

print pro2

num2 = (gets.chomp).to_f

div(pro2.length)


# Math symbol input

pro3 = "Please enter operation (+, -, *, /, %) = "

print pro3

in_op = (gets.chomp).to_s

div(pro3.length)


# Calculate symbol

sym = getOperator(in_op)


# Output header

nl(2)

math_head1 = "Math output"

puts math_head1

div(math_head1.length)

math_head2 = "Number 1 = #{ num1 } | Number 2 = #{ num2 } | Operation = #{ in_op }"

puts math_head2

div(math_head2.length)


# Output calculate

output_math = cal(num1, num2, sym)

puts output_math

div(output_math.length)


# Analyzer header

nl(2)

comp_head = "Analyzer"

puts comp_head

div(comp_head.length)


# Analyzer output

puts cal(num1, num2, :==)

puts cal(num1, num2, :<)

puts cal(num1, num2, :>)

puts cal(num1, num2, :!=)

puts cal(num1, num2, :>=)

puts cal(num1, num2, :<=)

