require_relative 'student'
require_relative 'teacher'
require_relative 'person'

class PersonCreator
  def initialize(people)
    @people = people
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp

    case input
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase

    case permission
    when 'N'
      student = Student.new(age, 'classroom', name: name, parent_permission: false)
      @people << student
    when 'Y'
      student = Student.new(age, 'classroom', name: name, parent_permission: true)
      @people << student
    end
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Enter name of teacher: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher
    puts 'Teacher created successfully'
  end
end
