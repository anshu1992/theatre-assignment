# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

venue = Venue.create(name: 'PVR', columns: 10, rows: 10)

venue.rows.times.each do |row|
    row = ('a'..'z').to_a[row-1]
    venue.rows.times.each do |column|
        column = ('1'..'10').to_a[column -1]
        venue.seats.create(row: row, column: column)
    end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?