require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(specialization, age, **defaults)
    @id = rand(1000..10_000)
    defaults[:name] ||= 'Unknown'
    defaults[:parent_permission] = true if defaults[:parent_permission].nil?

    super(age, **defaults)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end
end
