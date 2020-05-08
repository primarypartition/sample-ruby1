$global_variable = 10 # global variable

Class Vehicle {
   NO_OF_WHEELS = 4 # constant
   @horsepower # instance variable
      
   def speeding 
     local_var_fast # local variable
   end
      
   def driving
   
   end
end


class Customer
   @@no_of_customers = 0 # class variable, must init
   
   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
   end
end

cust1 = Customer. new
cust2 = Customer. new

cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")


class Accounts
   def reading_charge
   end
   
   # class methods
   def Accounts.return_date
   end
end

Accounts.return_date









