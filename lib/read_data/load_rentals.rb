def get_book(title)
  @books.each { |book| return book if book.title == title }
end

def get_person(id)
  @people.each { |person| return person if person.id == id }
end

def read_rentals(file_path)
  data = []
  return false unless File.exist?(file_path)

  file = File.read(file_path)
  JSON.parse(file).each do |rental|
    rental = Rental.new(rental['date'], get_book(rental['book']['title']), get_person(rental['person']['id']))
    data << rental
  end
  data
end
