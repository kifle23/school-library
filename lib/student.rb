require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_accessor :id

  def initialize(age, classroom, **defaults)
    @id = rand(30..5000)
    defaults[:name] ||= 'Unknown'
    defaults[:parent_permission] = true if defaults[:parent_permission].nil?
    super(age, **defaults)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }
  end
end
