require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name.slice(0, 10) : name
  end
end
