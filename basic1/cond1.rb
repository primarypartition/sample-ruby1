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

p1 = "Enter one of operation (+, -, *, /, %) = "

puts p1

op = (gets.chomp).to_s


puts getOperator(op)

