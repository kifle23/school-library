# The Rental class represents a rental with a date.
# It provides a getter and setter for the date.
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end

  def to_h
    {
      id: @id,
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end
end
