class Save
  def initialize(data, file_path)
    @data = data
    @file_path = file_path
  end

  def execute
    dir_path = File.dirname(@file_path)
    FileUtils.mkdir_p(dir_path)
    existing_data = []

    if File.exist?(@file_path)
      existing_data = JSON.parse(File.read(@file_path))
      existing_ids = existing_data.map { |d| d['id'] }
      @data.reject! { |new_d| existing_ids.include?(new_d[:id]) }
    end

    updated_data = existing_data + @data.map(&:to_h)
    File.write(@file_path, JSON.generate(updated_data))
  end
end
