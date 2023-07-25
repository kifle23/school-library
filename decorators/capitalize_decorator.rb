require_relative 'decorator'

# A decorator that capitalizes the name returned by the decorated object's `correct_name` method.
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
