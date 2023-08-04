require_relative 'rental'
class RentalLister
  def initialize(rentals)
    @rentals = rentals
  end

  def list_all_rentals
    print 'ID of the person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    list = []
    @rentals.each do |rental|
      list << "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    if list.empty?
      puts 'No record found for the selected person'
    else
      list.each { |rental| puts rental }
    end
  end
end
