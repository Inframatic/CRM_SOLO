require 'test/unit'
require_relative '../database.rb'
require_relative '../class_contact'

class TestDatabase <Test::Unit::TestCase

	def setup
		@arg_contact = {id: 100000,
													 firstname: "Ian",
													 lastname: "Steffy",
													 email: "isteffy@hotmail.com",
													 notes: "Cool guy"}
		@contact = Contact.new({id: 100000,
													 firstname: "Ian",
													 lastname: "Steffy",
													 email: "isteffy@hotmail.com",
													 notes: "Cool guy"})
		@cstorage = [({id: 100000,
							firstname: "Ian",
							lastname: "Steffy",
							email: "isteffy@hotmail.com",
							notes: "Cool guy"})]
		@db = Database.new		
	end

	def test_add_contact_asserted_in_cstorage_array
		assert_equal @db.cstorage, @db.add(@arg_contact)
	end

	def test_display_all_contacts_returns_nil_when_no_contact_added
		assert_equal [] ,@db.display_all_contacts
	end

	def	test_search_contact_displays_chosen_contact
		search_term = "Cool guy"
		assert_equal "id: 100000\n" +
	  	"first name: Ian\n" +
	  	"last name: Steffy\n" +
	  	"email: isteffy@hotmail.com\n" +
	  	"notes: Cool guy\n" ,@db.search_contact(search_term)
	end

	def test_modify_contact_mod_attribute_replaces_spec_attribute
		search_term = "Cool guy"
		spec_attribute = @firstname
		mod_attribute = "Jesus"

		assert_equal "id: 100000\n" +
	  	"first name: Jesus\n" +
	  	"last name: Steffy\n" +
	  	"email: isteffy@hotmail.com\n" +
	  	"notes: Cool guy\n" ,@db.modify_contact(@contact, spec_attribute, mod_attribute)
	end

	def test_display_info_by_attribute
		attribute = @firstname

		assert_equal [] ,@db.display_info_by_attribute(attribute)
	end
	
	def text_delete_contact_finds_and_deletes_selected_contact
		contact = "Ian"
						
		assert_equal 	"id: 100000\n" +
								  	"first name: Ian\n" +
								  	"last name: Steffy\n" +
								  	"email: isteffy@hotmail.com\n" +
								  	"notes: Cool guy\n", @db.delete_contact(@contact)
	end 

end	