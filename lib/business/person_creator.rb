require_relative '../domain/person'
require_relative '../domain/student'
require_relative '../domain/teacher'
require_relative '../domain/class_room'

# The PersonCreator class is responsible for creating new Person objects.
class PersonCreator
  def initialize(people)
    @people = people
  end

  def create_person
    puts 'Do you want to create a Student (1) or Teacher (2)? [Input the number]:'
    choice = gets.chomp.to_i
    person_creator = PersonCreator.new(@people)
    case choice
    when 1
      person_creator.create_student
    when 2
      person_creator.create_teacher
    end
  end

  def create_student
    name = read_person_name_from_user_input('Student')
    age = read_person_age_from_user_input
    parent_permission = read_parent_permission_from_user_input
    classroom_label = read_classroom_label_from_user_input

    student = create_new_student(name, age, parent_permission, classroom_label)
    puts "Created student #{student.name} with id #{student.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_person_name_from_user_input(type)
    print "#{type} name: "
    gets.chomp
  end

  def read_person_age_from_user_input
    print 'Age: '
    gets.chomp.to_i
  end

  def read_parent_permission_from_user_input
    print 'Has parent permission? (y/n): '
    gets.chomp.downcase == 'y'
  end

  def read_classroom_label_from_user_input
    print 'Classroom label: '
    gets.chomp
  end

  def create_new_student(name, age, parent_permission, classroom_label)
    student = Student.new(name, age, classroom_label, parent_permission: parent_permission)
    @people << student
    student
  end

  def create_teacher
    name = read_person_name_from_user_input('Teacher')
    age = read_person_age_from_user_input
    specialization = read_teacher_specialization_from_user_input

    teacher = create_new_teacher(name, age, specialization)
    puts "Created teacher #{teacher.name} with id #{teacher.id}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_teacher_specialization_from_user_input
    print 'Specialization: '
    gets.chomp
  end

  def create_new_teacher(name, age, specialization)
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    teacher
  end
end
