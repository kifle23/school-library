require_relative '../business/book_lister'
require_relative '../business/person_lister'
require_relative '../business/person_creator'
require_relative '../business/book_creator'
require_relative '../business/rental_creator'
require_relative '../business/rental_lister'
require_relative '../utilities/load'
require_relative '../utilities/save'

class IO
  def initialize(args = {})
    @strategies = {
      '1' => ListAllBooksStrategy.new(args[:book_lister]),
      '2' => ListAllPeopleStrategy.new(args[:person_lister]),
      '3' => CreatePersonStrategy.new(args[:person_creator]),
      '4' => CreateBookStrategy.new(args[:book_creator]),
      '5' => CreateRentalStrategy.new(args[:rental_creator]),
      '6' => ListRentalsByPersonId.new(args[:rental_lister]),
      '7' => ExitStrategy.new
    }
  end

  def handle_choice(choice)
    strategy = @strategies[choice] || InvalidChoiceStrategy.new
    strategy.execute
  end
end

class ListAllBooksStrategy
  def initialize(lister)
    @lister = lister
  end

  def execute
    @lister.list_all_books
    true
  end
end

class ListAllPeopleStrategy
  def initialize(lister)
    @lister = lister
  end

  def execute
    @lister.list_all_people
    true
  end
end

class CreatePersonStrategy
  def initialize(creator)
    @creator = creator
  end

  def execute
    @creator.create_person
    true
  end
end

class CreateBookStrategy
  def initialize(creator)
    @creator = creator
  end

  def execute
    @creator.create_book
    true
  end
end

class CreateRentalStrategy
  def initialize(creator)
    @creator = creator
  end

  def execute
    @creator.create_rental
    true
  end
end

class ListRentalsByPersonId
  def initialize(lister)
    @lister = lister
  end

  def execute
    @lister.list_rentals_by_person_id
    true
  end
end

class ExitStrategy
  def execute
    false
  end
end

class InvalidChoiceStrategy
  def execute
    puts 'Invalid choice'
    true
  end
end
