require_relative '../domain/rental'

class RentalLister
  def initialize(rentals, people, books)
    @rentals = rentals
    @people = people
    @books = books
  end

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
    @rentals.select { |r| r.person.id == person.id && r.person.name == person.name }
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
