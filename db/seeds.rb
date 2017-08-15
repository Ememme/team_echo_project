# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

	# User.delete_all
	# Denounce.delete_all

	# Town.delete_all
	Town.create(id: 1, name: "Poznań")
	# DenounceType.delete_all
	DenounceType.create(id: 1, value: 10, name: 'Anonim') #anonim
	DenounceType.create(id: 2, value: 30, name: 'Pokaż pseudonim') #wyświetlony nick
	DenounceType.create(id: 3, value: 50, name: 'Pokaż nazwisko') #wyświetlone nazwisko

	100.times do
		print ','
		user = User.create(name: FFaker::NamePL.name,
			nick: FFaker::BaconIpsum.word,
			email: FFaker::Internet.email,
			password: 'password',
			password_confirmation: 'password'
		)
		rand(10).times do
			print '.'
			Denounce.create(
				content: FFaker::BaconIpsum.sentence,
				author_user_id: user.id,
				denounced_user_id: rand(user.id)+1,
				town_id: 1,
				denounce_type_id: rand(3)+1,
				created_at: rand(1000).hours.ago
			)
		end
	end
