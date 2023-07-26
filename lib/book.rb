# The Book class represents a book with a title and an author.
# It provides getters and setters for the title and author.
class Book
    attr_accessor :title, :author
  
    def initialize(title, author)
      @title = title
      @author = author
    end
end