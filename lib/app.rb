require_relative 'book'
require_relative 'person'
require_relative 'rental'

# The `App` class represents an application that manages a collection of books, people, and rentals.
# It provides methods to list all books and people, create a person (student or teacher), create a book,
# create a rental, and list all rentals for a given person ID.
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person(name, age, parent_permission, type)
    if type == 'student'
      @people << Student.new(name, age, parent_permission: parent_permission)
    elsif type == 'teacher'
      @people << Teacher.new(name, age)
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(date, book_id, person_id)
    book = @books.find { |book| book.id == book_id }
    person = @people.find { |person| person.id == person_id }
    rental = Rental.new(date, book, person)
    @rentals << rental
    person.add_rental(rental)
    book.add_rental(person, date)
  end

  def list_rentals(person_id)
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    rentals.each { |rental| puts rental }
  end
end