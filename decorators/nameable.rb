# A base class for objects that have a name attribute and provide a
# method to return a correctly formatted version of that name.
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end
