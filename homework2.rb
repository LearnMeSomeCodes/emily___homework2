def get_answer
	menu = ["create", "view", "delete", "quit"]
	entry = ""
	while not menu.include? entry do
		puts "\nWelcome to your address book main menu!\n
What would you like to do?\n
Enter \"create\" to create a new entry
Enter \"view\" to view an existing entry
Enter \"delete\" to delete an existing entry
Enter \"quit\" to quit the application\n\n"
		entry = gets.chomp
		if not menu.include? entry 
			puts "\nUnfortunately this is not a menu item. Please try again.\n"
		else
			return entry
		end
	end
end

def assign_answer
	address_book = []
	menu_entry = get_answer

	if menu_entry == "create"
		def new_entry
			address_book_temp = []
			puts "\nYou are adding a new entry.\n\n"
			print "What is the first name? "
			first_name = gets.chomp
			address_book_temp.push first_name
			print "What is the last name? "
			last_name = gets.chomp
			address_book_temp.push last_name
			print "What is the phone number (xxx-xxx-xxxx)? "
			phone_number = gets.chomp
			address_book_temp.push phone_number
			print "What is the email address? "
			email_address = gets.chomp
			address_book_temp.push email_address
			puts "\nYou successfully added a contact you to your address book!\n\n"
			return address_book_temp
		end
		address_book << new_entry
		puts address_book.inspect
		loop do
			assign_answer
			break if get_answer == "quit"
		end
	
	elsif menu_entry == "view"
		puts "View an existing entry"
	
	elsif menu_entry == "delete"
		puts "Delete an existing entry"
	
	elsif menu_entry == "quit"
		puts "Goodbye!"
		exit
	
	end
end

puts assign_answer