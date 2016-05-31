# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(first_name: "Obed", last_name: "Tandadjaja", display_name: "Obed Tandadjaja", email: "obed.tandadjaja@gmail.com",
	password: "testing123", street_address: "2050 E Fir Ave APT 203", city: "Fresno", state: "CA", zip: "93720",
	phone: "(559)4737-555")