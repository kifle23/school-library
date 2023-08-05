# The Book class represents a book with a title and an author.
# It provides getters and setters for the title and author.
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author, id: 0)
    @id = id.zero? ? rand(1000..10_000) : id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end

  def to_h
    {
      id: @id,
      title: @title,
      author: @author
    }
  end
end
