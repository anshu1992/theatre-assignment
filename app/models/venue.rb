class Venue < ApplicationRecord
  has_many :seats

  def center
    (columns.to_f/2.to_f).ceil
  end
end
