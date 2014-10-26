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

puts get_answer