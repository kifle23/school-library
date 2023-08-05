require 'json'
require 'fileutils'

class Load
    def initialize(file_path, loader_method)
      @file_path = file_path
      @loader_method = loader_method
    end
  
    def execute
      return [] unless File.exist?(@file_path)
  
      json_data = JSON.parse(File.read(@file_path))
      json_data.map { |data| send(@loader_method, data) }
    end
  
    private
  
    def load_books_from_json(data)
      Book.new(data['title'], data['author'], id: data['id'])
    end

    def load_people_from_json(data)
        case data['type']
        when 'Student'
          Student.new(data['name'], data['age'], data['classroom']['label'], parent_permission: data['parent_permission'], id: data['id'])
        when 'Teacher'
          Teacher.new(data['name'],data['age'], data['specialization'], id: data['id'])
        end
    end
end