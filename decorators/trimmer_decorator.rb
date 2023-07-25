require_relative 'decorator'

# A decorator that trims the name returned by the decorated object's
# `correct_name` method to a maximum length of 10 characters.
class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name.slice(0, 10) : name
  end
end
