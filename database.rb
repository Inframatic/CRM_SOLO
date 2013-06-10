require_relative 'class_contact'

class Database
	attr_accessor :cstorage

	def initialize
		@cstorage = Array.new
	end

	def add(contact)
	 		@cstorage << Contact.new(contact)
	end

	def display_all_contacts
	 	@cstorage.each do |contact|
	 		puts "----------------------"
	 		puts contact.display
	 		puts ""
	  end
	end

	def search_contact(search_term)
	  @cstorage.each do |contact|	
	 		if (contact.id == search_term ||
		 		contact.firstname == search_term ||
		 		contact.lastname == search_term ||
		 		contact.email == search_term ||
		 		contact.notes == search_term )
	 			puts contact.display
	  	end
	  end	  		  	
	end	

	def modify_contact(contact, spec_attribute, mod_attribute)
		contact.send("#{spec_attribute}=" ,mod_attribute)
		puts contact.display
	end

	def display_info_by_attribute(attribute)
		@cstorage.each do |contact|
			puts contact.send(attribute)
		end
	end

	def delete_contact(contact)
		contacts_index = @cstorage.index(contact)
		@cstorage.delete_at(contacts_index)
		puts "Contact has been deleted"
	end

end