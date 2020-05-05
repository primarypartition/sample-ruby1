def nl(times=1)
  print "\n" * times
end

def seperator(len)
  (len).times { print "-" }
end

def h1(title)  
  nl
  print title
  nl
  seperator(title.length)
  nl(2)
end

def invalid(msg)
  nl
  print msg
  nl(2)
end

def map_model

  city_codes = {
    "newyork" => "212",
    "newbrunswick" => "732",
    "edison" => "908",
    "plainsboro" => "609",
    "sanfrancisco" => "301",
    "miami" => "305",
    "paloalto" => "650",
    "evanston" => "847",
    "orlando" => "407",
    "lancaster" => "717"
  }

  return city_codes

end

def map_model_cities
  cities = map_model.keys
  return cities
end

def map_model_area_codes
  area_codes = map_model.values
  return area_codes
end

def p_col(list)
  list.each {|item| print item; nl}
end

def search_list(list, val)
  if(list.include?(val))
    return list[val]
  elsif(list.key(val))
    return list.key(val)
  else
    return false
  end
end

def area_code_lookup
  h1("| List of cities |")
  
  p_col(map_model_cities)
  nl

  print "Which city area code? "
  option = (gets.chomp).to_s
  nl
  
  if(area_code = search_list(map_model, option))
    print "Area code for #{option} is " + area_code.to_s
    nl
  else
    invalid("Area code not found.")    
  end
end

def city_lookup
  h1("| List of area codes |")
  
  p_col(map_model_area_codes)
  nl

  print "Which area code city? "
  option = (gets.chomp).to_s
  nl

  if(city = search_list(map_model, option))
    print "City for #{option} is " + city
    nl
  else
    invalid("City not found.")    
  end
end

h1("~~~Welcome to phone book~~~")

check = true
op_city_search = 1
op_area_code_search = 2
op_exit = 3

while(check)

  h1("| Options |")
  
  print "1 for city lookup by area code."
  nl
  print "2 for area code lookup by city."
  nl
  print "3 for exit."
  nl(2)

  print "Enter choice [1-3]: "
  option = (gets.chomp).to_i

  if(option == op_city_search)
    city_lookup
  elsif(option == op_area_code_search)
    area_code_lookup
  elsif(option == op_exit)
    break
  else
    invalid("Invalid option.")
  end

end
