def read_people(file_path)
  data = []
  return false unless File.exist?(file_path)

  file = File.read(file_path)
  JSON.parse(file).each do |person|
    if person['type'] == 'Student'
      student = Student.new(person['age'], person['classroom'], name: person['name'],
                                                                parent_permission: person['parent_permission'])
      student.id = person['id']
      data << student
    else
      teacher = Teacher.new(person['specialization'], person['age'], name: person['name'],
                                                                     parent_permission: person['parent_permission'])
      teacher.id = person['id']
      data << teacher
    end
  end
  data
end
