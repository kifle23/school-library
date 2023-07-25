require_relative 'nameable'

# A base class for decorators that add functionality to an object without modifying its behavior.
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
