require_relative 'person'

class PersonLister
  def initialize(people)
    @people = people
  end

  def list_all_people
    if @people.empty?
      puts 'No people found.'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }
    end
  end
end
