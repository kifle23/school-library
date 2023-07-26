require_relative 'lib/person'
require_relative 'lib/class_room'
require_relative 'lib/student'
require_relative 'decorators/capitalize_decorator'
require_relative 'decorators/trimmer_decorator'


person = Person.new('maximilianus', 22)

puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
math_class = Classroom.new('Math')
student1 = Student.new('Alice', 16, parent_permission: true, classroom: math_class)
english_class = Classroom.new('English')
student2 = Student.new('Bob', 17, parent_permission: true, classroom: english_class)
math_class.add_student(student1)
english_class.add_student(student2)
puts math_class.students.inspect
puts english_class.students.inspect
student3 = Student.new('Charlie', 15)
math_class.add_student(student3)
puts student3.classroom
puts math_class.students