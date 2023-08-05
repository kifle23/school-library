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
end