require_relative 'menu'
require_relative 'io'

# The main application class for managing rentals of books to people.
class App
  BOOKS_FILE = './data/books.json'.freeze
  PEOPLE_FILE = './data/people.json'.freeze
  RENTALS_FILE = './data/rentals.json'.freeze

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
    @book_lister = BookLister.new(@books)
    @person_lister = PersonLister.new(@people)
    @person_creator = PersonCreator.new(@people)
    @book_creator = BookCreator.new(@books)
    @rental_creator = RentalCreator.new(@books, @people, @rentals)
    @rental_lister = RentalLister.new(@rentals, @people, @books)
    @menu = Menu.new
    @io = @io = IO.new(
      book_lister: BookLister.new(@books),
      person_lister: PersonLister.new(@people),
      person_creator: PersonCreator.new(@people),
      book_creator: BookCreator.new(@books),
      rental_creator: RentalCreator.new(@books, @people, @rentals),
      rental_lister: RentalLister.new(@rentals, @people, @books)
    )
  end

  def start
    loop do
      @menu.print
      choice = gets.chomp.downcase
      break unless @io.handle_choice(choice)

      puts "\n"
    end
    save_data
  end

  private

  def save_data
    Save.new(@books.map(&:to_h), BOOKS_FILE).execute
    Save.new(@people.map(&:to_h), PEOPLE_FILE).execute
    Save.new(@rentals.map(&:to_h), RENTALS_FILE).execute
  end

  def load_data
    @books = Load.new(BOOKS_FILE, :load_books_from_json).execute || []
    @people = Load.new(PEOPLE_FILE, :load_people_from_json).execute || []
    @rentals = Load.new(RENTALS_FILE, :load_rentals_from_json).execute || []
  end
end
