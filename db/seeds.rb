5.times do 
	Plant.create({
		name: Faker::Book.title,
		humidity: Faker::Commerce.price,
		sunlight: Faker::App.version
	})
end