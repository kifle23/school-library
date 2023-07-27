# frozen_string_literal: true

# The Book class represents a book with a title and an author.
# It provides getters and setters for the title and author.
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end
end
