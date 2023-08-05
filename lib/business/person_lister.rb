require_relative '../domain/person'

class PersonLister
  def initialize(people)
    @people = people
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
      return
    end

    puts 'All people:'
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
