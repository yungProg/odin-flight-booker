# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[ACC AAL AES AAR YXX ABZ ABR ABJ ABI AUH BWI BMV BLR BFL CRK CAK DAA DAB DAC DAD DAF EAA EAB EAE EAL FAA FAB FAC FAE GAA GAB GAC GAD GAE HAA HAB HAC HAD HAH IAA IAB IAD IAG JAA JAB JAC. JAD KAA KAB KAD KOP LEI LAA LEN MOI MOU MAB NNA NBI NAA NEA OOP OAA ODE PPM PAA PLA PEO QAA QOU RIY RFA RTA RDS SCA SSE SSM TOW TOA TWE UAA UAB UMC VOA VIO VOU WER WTR WFE XAA XOA XME YIN YFD YJG YQW ZKL ZAA ZAS ZBA].each do |airport_code|
  Airport.find_or_create_by! airport_code: airport_code
end

airports = Airport.all

50.times do
  Flight.create! departure_airport: airports.sample, arrival_airport: airports.sample, duration: rand(3000..9000), start_datetime: rand(1..200).hours.after, number_of_passengers: rand(1..4)
end

6.times do
  Flight.create! departure_airport: airports.first, arrival_airport: airports.last, duration: rand(3000..9000), start_datetime: rand(1..200).hours.after, number_of_passengers: rand(1..4)
end
