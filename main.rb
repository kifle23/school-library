require_relative 'lib/app'

# The `main` method is the entry point for the application.
# It creates an instance of the `App` class and enters
# a loop that presents the user with a list of options to perform.

def main
  app = App.new

  loop do
    display_menu_options
    choice = read_user_choice_from_menu

    break if choice == 7

    perform_action_for_choice(choice, app)
    puts "\n"
  end
end

def display_menu_options
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Quit'
  print '> '
end

def read_user_choice_from_menu
  gets.chomp.to_i
end

def perform_action_for_choice(choice, app)
  case choice
  when 1 then app.list_books
  when 2 then app.list_people
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.list_rentals_by_person_id
  else puts 'Invalid choice. Please try again.'
  end
end

main
