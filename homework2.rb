def get_answer
	menu = ["create", "view", "delete", "quit"]
	entry = ""
	while not menu.include? entry do
		puts "\nEnter \"create\" to create a new entry
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

def assign_answer (a)
	menu_entry = get_answer
	
	if menu_entry == "create"

		new_entry = lambda do
			address_book_temp = []
			puts "\nYou are adding a new entry.\n\n"
			print "What is the first name? "
			first_name = gets.chomp
			address_book_temp.push first_name
			print "What is the last name? "
			last_name = gets.chomp
			address_book_temp.push last_name
			print "What is the phone number? "
			phone_number = gets.chomp
			address_book_temp.push phone_number
			print "What is the email address? "
			email_address = gets.chomp
			address_book_temp.push email_address
			puts "\nYou successfully added a contact you to your address book!\n\n"
			return address_book_temp
		end

		a << new_entry.call
		puts a

		loop do
			assign_answer(a)
			break if get_answer == "quit"
		end
	
	elsif menu_entry == "view"

		retrieve_entry = lambda do
			puts "\n**************************************"
				a.length.times do |index|
					print index," ",a[index][1],", ",a[index][0]
					puts""
				end
			puts "**************************************"
			print "\nWhich entry would you like to view (enter \"9999\" to return to main menu)? "
			index = gets.chomp.to_i
			if a.empty?
				puts "\nWhoops it looks like the array is empty!\nRedirecting you to the main menu..."
				loop do
					assign_answer(a)
					break if get_answer == "quit"
				end
			elsif index == 9999
				puts "\nRedirecting you to the main menu..."
				loop do
					assign_answer(a)
					break if get_answer == "quit"
				end
			elsif index >= 0 and index <= a.length-1
				puts ""
				print a[index][1],", ",a[index][0],"\n",a[index][2],"\n",a[index][3]
				puts ""
			else
				puts "\nSorry, that's an invalid entry! Try again."
				puts retrieve_entry.call
			end
		end

		retrieve_entry.call
		loop do
			assign_answer(a)
			break if get_answer == "quit"
		end
	
	elsif menu_entry == "delete"
		
		delete_entry = lambda do
			puts "\n**************************************"
				a.length.times do |index|
					print index," ",a[index][1],", ",a[index][0]
					puts""
				end
			puts "**************************************"
			print "\nWhich entry would you like to delete (enter \"9999\" to return to main menu)? "
			index = gets.chomp.to_i
			if a.empty?
				puts "\nWhoops it looks like the array is empty!\nRedirecting you to the main menu..."
				loop do
					assign_answer(a)
					break if get_answer == "quit"
				end
			elsif index == 9999
				puts "\nRedirecting you to the main menu..."
				loop do
					assign_answer(a)
					break if get_answer == "quit"
				end
			elsif index >= 0 and index <= a.length-1
				puts ""
				print "Now deleting #{a[index][0]} #{a[index][1]}..."
				puts ""
				a.delete_at index-1
			else
				puts "\nSorry, that's an invalid entry! Try again."
				puts delete_entry.call
			end
		end

		puts "\nHere is your updated address book:\n\n"
		delete_entry.call

		loop do
			assign_answer(a)
			break if get_answer == "quit"
		end
	
	elsif menu_entry == "quit"
		puts "\nGoodbye!"
		puts ""
		exit
	
	end

end

address_book = []
puts "\nWelcome to your address book main menu!\n\nWhat would you like to do?"
puts assign_answer(address_book)