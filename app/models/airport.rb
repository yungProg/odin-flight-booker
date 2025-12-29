class Airport < ApplicationRecord
  validates :airport_code, presence: true, uniqueness: true
  validates :id, presence: true, uniqueness: true

  has_many :departing_flights, class_name: "Flight", foreign_key: :departure_airport_id, inverse_of: :departure_airport
  has_many :arriving_flights, class_name: "Flight", foreign_key: :arrival_airport_id, inverse_of: :arrival_airport
end
