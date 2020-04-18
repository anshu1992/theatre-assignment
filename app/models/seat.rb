class Seat < ApplicationRecord
  belongs_to :venue

  enum status: [ :available, :booked ]
  delegate :columns, to: :venue, prefix: true
  delegate :rows, to: :venue, prefix: true

  def self.best_seat(seat_count = 1, venue)
    center = venue.center
    row = seats_available_in_row(seat_count)&.first&.row
    return [] unless row
    Seat.available.where(row: row).order("abs(seats.column - #{center})").limit(seat_count)
  end

  def self.seats_available_in_row(seat_count = 1)
    find_by_sql("SELECT * FROM seats WHERE seats.status = 0 AND row  IN (SELECT row FROM seats GROUP BY row HAVING COUNT(*) >= #{seat_count}) ORDER BY seats.row ASC")
  end
end
