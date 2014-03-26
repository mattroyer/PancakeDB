require 'faker'

@number_of_records = 200_000
@header = "name|zip|city|state|address"

File.open("example/test", "a+") do |f|
  f.puts @header
  1.upto(@number_of_records) { f.puts "#{Faker::Name.first_name} #{Faker::Name.last_name}|#{Faker::Address.postcode}|#{Faker::Address.city}|#{Faker::Address.state_abbr}|#{Faker::Address.street_address}" }
end
