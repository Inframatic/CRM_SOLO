require_relative 'database'
require_relative 'class_contact'

	class Runner
		TYPE_AREA = "_"*10 + "\b"*10
	

		def self.run
			database = Database.new
			id = 1000000

 		
 		
 	# puts  "Welcome to Ian Steffy's contact Database"
 	# sleep 3
	 		while true
		 	 puts "If you would like to add a contact, type 'add'"
		 	 puts "To modify an existing contact, type 'modify'"
		 	 puts "To display all contacts, type 'all'"
		 	 puts "To display a particular contact, type 'one'"
		 	 puts "To display contacts by an attribute, type 'trait'"
		 	 puts "To delete a contact, type 'delete'"
		 	 puts "To exit, type 'exit'"
	 	 	 users_input = gets.chomp.downcase
			 puts users_input 
			 puts "\e[H\e[2J"
		 	

		 	 if users_input == 'exit'
		 				break
		 	 elsif users_input == 'add'
						puts "Please enter their first name" 
		 	   		firstname = gets.chomp.downcase
		 	   		puts "\e[H\e[2J"								 	   		

						puts "Please enter their last name"
		 	   		lastname = gets.chomp.downcase
		 	   		puts "\e[H\e[2J"		 	   		

						puts "Please enter their email"
		 	   		email = gets.chomp.downcase
		 	   		puts "\e[H\e[2J"		 	   		

						puts "Please enter any other notes"
		 	   		notes = gets.chomp.downcase
		 	   		puts "\e[H\e[2J"

		 	   		contact = {id: id,
		 	   							firstname: firstname,
		 	   							lastname: lastname,
		 	   							email: email,
		 	   							notes: notes}

		 	   		database.add(contact)
		 	   		puts "*Contact has been added*"
		 	   		puts ""
		 	   		id += 1
		 	 elsif users_input == 'all'
		 	 	 puts "====================="
		 	   puts "To list all contacts, type 'all'"
		 	   puts "====================="
		 	   all = gets.chomp.downcase
		 	   database.display_all_contacts
		 	 elsif users_input == 'one'
		 	 	 puts "======================"
		 	 	 puts "Enter any attribute of the contact you wish to display"
		 	 	 puts "======================"
		 	 	 search_term = gets.chomp.downcase
		 	 	 contact = database.search_contact(search_term)
		 	 elsif users_input == "modify"
		 	 	 puts "Please enter first name, lastname, email, or notes of contact you wish to retrieve"
		 	 	 search_term = gets.chomp.downcase
		 	 	 contact = database.search_contact(search_term)
		 	 	 database.search_contact(search_term)
		 	 	 puts "----------------------"
		 	 	 puts "Which attribute would you like changed?"
		 	 	 puts "firstname"
		 	 	 puts "lastname"
		 	 	 puts "email"
		 	 	 puts "notes"		 	 	 
		 	 	 spec_attribute = gets.chomp.downcase
		 	 	 puts "----------------------"
		 	 	 puts "What should the new #{spec_attribute} be renamed?"
		 	 	 mod_attribute = gets.chomp.downcase
		 	 	 database.modify_contact(contact, spec_attribute, mod_attribute)
		 	 elsif users_input == 'trait'
		 	 	 puts "Your options are: id, firstname, lastname, email, or notes"
 		 	 	 print "Display attributes by " + TYPE_AREA
		 	 	 attribute = gets.chomp
		 	 	 puts ""
		 	 	 database.display_info_by_attribute(attribute)
		 	 	 puts "----------------------"
		 	 elsif users_input == 'delete'
		 	 	 puts "Enter an attribute of the contact you wish to delete"
		 	 	 search_term = gets.chomp.downcase
		 	 	 contact = database.search_contact(search_term)
		 	 	 puts contact.display
		 	 	 puts ""
		 	 	 puts "Are you sure you want to delete this contact? y/n"
		 	 	 delete = gets.chomp.downcase
		 	 	   if delete == "y"
		 	 	     database.delete_contact(contact)
		 	 	   end
		 	 elsif users_input == 'exit'
		 	 	break
		 	 else
		 	 	puts "======================"
		 	 	puts "Invalid Command"
		 	 	puts "======================"
		 	 end
		 	end
	end

end

Runner.run