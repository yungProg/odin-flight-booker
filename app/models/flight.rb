class Flight < ApplicationRecord
  col_names = [ :departure_airport_id, :arrival_airport_id, :duration, :number_of_passengers ]
  col_names.each do |col_name|
    validates col_name, presence: true
  end
  # validates :id, presence: true, uniqueness: true

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :passengers
  has_many :bookings, through: :passenger
end
