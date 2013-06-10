#-> Tests : they are checklist of things that the app should be able to do 
#use throughout development to catch errors 
#unit testing - testing isolated chuncks of code ex.testing one method, doesnt simulate how a user would be using an application
#integration tests - combine unit tests into a more comprehensive test, tests dependencies between the classes 

Ruby testing frameworks
#Test unit - built into ruby
#Mini test 
#Rspec - more english based syntax

Good tests:
#isolated - should not fail/pass other tests because it ran before/after them
# 		  - tests one thing 
#tests the APIm not the internal. ex if the total method is called and it uses subtotal, you would test total not subtotal
#if you arnt sure how to write a test, it is probably not well written code
#Quick to run
#unique - multiple tests dont test the same thing
#should have multiple tests per method to test all cases(outcomes) in the method ( ex if you dont properly use it, each section of an if statement)

require 'test/unit'
#the first line of code in testing 

class ClassName <Test::Unit::TestCase
# either uses test unit in ruby 1.8 or Mini test in ruby 1.9


rake test 
#-> rake is a task runner and your telling it to run all the tests


#tests should be in their own file

require 'test/unit'
require_relative '../crm_contact'
class TestContact < Test::Unit::TestCase
	def test_initialize_with_valid_params_works
		##method names that you want to test must start with test_ so that it knows that they are test,
		#otherwise it thinks that they are just helper methods to run your tests

		contact = Contact.new(5,"Will","Richman","","")
		# Assert that the variables passed in are retrievable and therefore saved correctly
		assert_equal contact 5, contact.id 
		# Assert that you get back an instance of a contact
		assert contact.is_a?(Contact)

	end


end

## want a different file for each class that you are testing
require 'test/unit'
require_relative '../crm_database'
class TestDatabase < Test::Unit::TestCase
	def setup
		#this setup needs to be done for multiple tests so can be its own setup method
		@contact = Contact.new(5,"Will","Richman","","")
		@db = Database.new
		@db.add(contact)
	end

	def test_modify_contact_returns_nil_for_unknown_contact
		
		contact = Contact.new(5,"Will","Richman","","")
		db = Database.new
		db.add(contact)
	end
end
