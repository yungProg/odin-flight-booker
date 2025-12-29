class Booking < ApplicationRecord
  validates :flight_id, presence: true

  has_many :passengers, inverse_of: :booking
  has_many :flights, through: :passengers

  accepts_nested_attributes_for :passengers
end
