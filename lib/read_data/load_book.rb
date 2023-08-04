def read_books(file_path)
  data = []
  return false unless File.exist?(file_path)

  file = File.read(file_path)
  JSON.parse(file).each do |book|
    data << Book.new(book['title'], book['author'])
  end
  data
end
