def nl(times=1)
	print "\n" * times
end

def seperator(len)
	(len).times { print "-" }
end

def user_model
	users = [
		{:username => "joe", :password => "joepass"},
		{:username => "john", :password => "johnpass"},
		{:username => "mary", :password => "marypass"}
	]

	return users
end

def user_auth(username, password)
	user_model.each do |user|
		if(user[:username] == username && user[:password] == password)
			return user		
		end
	end 

	return false
end


prog_head = "Welcome to auth system!"
print prog_head

nl
seperator(prog_head.length)
nl(2)


check = true
allowed_attempts = 3
num_of_attempts = 0

while(check) do 
	num_of_attempts = num_of_attempts + 1

	if(num_of_attempts > allowed_attempts)
		nl
		print "Allowed attempts over."
		nl
		break;
	end

	print "Enter username: "
	username = (gets.chomp).to_s

	print "Enter password: "
	password = (gets.chomp).to_s

	if(user = user_auth(username, password))
		nl
		print "Welcome to Mars!"
		nl
		print user
		nl
		break
	else
		nl
		print "Invalid username or password. Try again."
		nl(2)	
	end
end
