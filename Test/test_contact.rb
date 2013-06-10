require 'test/unit'
require_relative '../class_contact.rb'
class TestContact <Test::Unit::TestCase
	
	def test_initialize_with_valid_params_works
		contact = Contact.new({id: 100000,
													 firstname: "Ian",
													 lastname: "Steffy",
													 email: "isteffy@hotmail.com",
													 notes: "Cool guy"})

		assert_equal contact.firstname, "Ian"
		assert contact.is_a?(Contact)
	end

	def test_diplay_to_see_puts_string
		 contact = Contact.new({id: 100000, firstname: "Ian", lastname: "Steffy", email: "isteffy@hotmail.com", notes: "Cool guy"})

		assert_equal "id: 100000\n" +
	  	"first name: Ian\n" +
	  	"last name: Steffy\n" +
	  	"email: isteffy@hotmail.com\n" +
	  	"notes: Cool guy\n", contact.display
	end

end

