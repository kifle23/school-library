require_relative '../business/book_lister'
require_relative '../business/person_lister'

class IO
  def initialize(args = {})
    @strategies = {
      '1' => ListAllBooksStrategy.new(args[:book_lister]),
      '2' => ListAllPeopleStrategy.new(args[:person_lister]),
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
