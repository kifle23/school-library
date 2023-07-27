require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'class_room'
require_relative 'rental'
require_relative 'student'
require_relative 'person_creator'
require_relative 'book_creator'
require_relative 'rental_creator'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'All books:'
    if @books.empty?
      puts 'No books available.'
    else
      @books.each do |book|
        puts "Title:\"#{book.title}\", Author:#{book.author}"
      end
    end
  end

  def list_people
    puts 'All people:'
    if @people.empty?
      puts 'No people available.'
    else
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.is_a?(Teacher)
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts 'Unknown person type'
        end
      end
    end
  end

  def create_person
    puts 'What type of person would you like to create?'
    puts '1. Student'
    puts '2. Teacher'
    print '> '

    choice = gets.chomp.to_i

    person_creator = PersonCreator.new(@people)

    case choice
    when 1
      person_creator.create_student
    when 2
      person_creator.create_teacher
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def create_book
    book_creator = BookCreator.new(@books)
    book_creator.create_book
  end

  def create_rental
    rental_creator = RentalCreator.new(@books, @people, @rentals)
    rental_creator.create_rental
  end

  def list_rentals_by_person_id
    print 'Person id: '
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