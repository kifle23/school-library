# frozen_string_literal: true

require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'class_room'
require_relative 'rental'
require_relative 'student'

# The `App` class represents an application that manages a collection of books, people, and rentals.
# It provides methods to list all books and people, create a person (student or teacher), create a book,
# create a rental, and list all rentals for a given person ID.

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts "All books:"
    if @books.empty?
      puts "No books available."
    else
      @books.each do |book|
        puts "Title:\"#{book.title}\", Author:#{book.author}"
      end
    end
  end

  def list_people
    puts "All people:"
    if @people.empty?
      puts "No people available."
    else
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.is_a?(Teacher)
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "Unknown person type"
        end
      end
    end
  end

  def create_person
    puts "What type of person would you like to create?"
    puts "1. Student"
    puts "2. Teacher"
    print "> "

    choice = gets.chomp.to_i

    case choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "Invalid choice. Please try again."
    end
  end

  def create_student
    print "Name: "
    name = gets.chomp

    print "Age: "
    age = gets.chomp.to_i

    print "Has parent permission? (y/n): "
    parent_permission = gets.chomp.downcase == 'y'

    print "Classroom label: "
    classroom_label = gets.chomp

    student = Student.new(name, age, parent_permission: parent_permission, classroom: Classroom.new(classroom_label))
    @people << student
    puts "Created student #{student.name} with id #{student.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def create_teacher
    print "Name: "
    name = gets.chomp

    print "Age: "
    age = gets.chomp.to_i

    print "Specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts "Created teacher #{teacher.name} with id #{teacher.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    if @books.any? { |book| book.title == title && book.author == author }
      print "A book with that title and author already exists. Create anyway? (y/n): "
      create_anyway = gets.chomp.downcase == 'y'
      return unless create_anyway
    end

    book = Book.new(title, author)
    @books << book
    puts "Created book '#{book.title}' by #{book.author}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def create_rental
    puts "Available books:"
    @books.each_with_index do |book, index|
      puts "#{index}) Title:\"#{book.title}\", Author:#{book.author}"
    end
  
    print "Select a book (by index): "
    book_index = gets.chomp.to_i
    book = @books[book_index]
  
    unless book
      puts "Invalid book index."
      return
    end
  
    puts "Available people:"
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}) Unknown person type"
      end
    end
  
    print "Select a person (by index): "
    person_index = gets.chomp.to_i
    person = @people[person_index]
  
    unless person
      puts "Invalid person index."
      return
    end
  
    print "Rental date (yyyy-mm-dd): "
    rental_date = gets.chomp
    rental = Rental.new(rental_date, book, person)
    @rentals << rental
  
    puts "Created rental for '#{book.title}' by #{book.author} on #{rental_date}, for #{person.name} (id: #{person.id})."
  end

  def list_rentals_by_person_id
    print "Person id: "
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    unless person
      puts "Could not find person with id #{person_id}."
      return
    end

    rentals = @rentals.select { |r| r.person == person }

    if rentals.empty?
      puts "#{person.name} (id: #{person.id}) has no rentals."
    else
      puts "All rentals for #{person.name} (id: #{person.id}):"
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end