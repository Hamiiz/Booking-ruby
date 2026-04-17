require_relative "user"
require_relative "resource"
require_relative "booking"

# create users
user1 = User.new(id: 1, name: "Hamza", role: "student")
user2 = User.new(id: 2, name: "Ali", role: "student")

# create resources
res1 = Resource.new(id: 1, name: "Microscope", category: "lab")
res2 = Resource.new(id: 2, name: "Projector", category: "electronics")

# create booking
booking1 = Booking.new(user: user1, resource: res1)
puts "Booking created"

# try duplicate booking
begin
  booking2 = Booking.new(user: user2, resource: res1)
rescue => e
  puts "Error: #{e.message}"
end

# cancel booking
booking1.cancel
puts "Booking cancelled"

# try again after cancel
booking3 = Booking.new(user: user2, resource: res1)
puts "New booking created after cancel"
