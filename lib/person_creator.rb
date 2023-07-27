require_relative 'person'
require_relative 'student'
require_relative 'class_room'
class PersonCreator
  def initialize(people)
    @people = people
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Has parent permission? (y/n): '
    parent_permission = gets.chomp.downcase == 'y'

    print 'Classroom label: '
    classroom_label = gets.chomp

    student = Student.new(name, age, parent_permission: parent_permission, classroom: Classroom.new(classroom_label))
    @people << student
    puts "Created student #{student.name} with id #{student.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts "Created teacher #{teacher.name} with id #{teacher.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end