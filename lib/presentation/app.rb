require_relative '../domain/book'
require_relative '../domain/person'
require_relative '../domain/teacher'
require_relative '../domain/class_room'
require_relative '../domain/rental'
require_relative '../domain/student'
require_relative '../business/person_creator'
require_relative '../business/book_creator'
require_relative '../business/rental_creator'
require_relative 'menu'
require_relative 'io'

# The main application class for managing rentals of books to people.
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @book_lister = BookLister.new(@books)
    @person_lister = PersonLister.new(@people)
    @person_creator = PersonCreator.new(@people)
    @book_creator = BookCreator.new(@books)
    @rental_creator = RentalCreator.new(@books, @people, @rentals)
    @menu = Menu.new
    @io = @io = IO.new(
      book_lister: BookLister.new(@books),
      person_lister: PersonLister.new(@people),
      person_creator: PersonCreator.new(@people),
      book_creator: BookCreator.new(@books),
      rental_creator: RentalCreator.new(@books, @people, @rentals),
    )
  end

  # def create_rental
  #   rental_creator = RentalCreator.new(@books, @people, @rentals)
  #   rental_creator.create_rental
  # end

  def list_rentals_by_person_id
    person_id = read_person_id_from_user_input
    person = find_person_by_id(person_id)

    return unless person

    rentals = get_rentals_by_person(person)

    if rentals.empty?
      puts "#{person.name} (id: #{person.id}) has no rentals."
    else
      puts "All rentals for #{person.name} (id: #{person.id}):"
      print_rentals(rentals)
    end
  end

  def read_person_id_from_user_input
    print 'Person id: '
    gets.chomp.to_i
  end

  def find_person_by_id(id)
    person = @people.find { |p| p.id == id }
    unless person
      puts "Could not find person with id #{id}."
      return nil
    end
    person
  end

  def get_rentals_by_person(person)
    @rentals.select { |r| r.person == person }
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def start
    loop do
      @menu.print
      choice = gets.chomp.downcase
      break unless @io.handle_choice(choice)

      puts "\n"
    end
  end
end
