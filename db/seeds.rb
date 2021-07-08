# Create a main sample user.
User.create!(name: "Nguyen Quoc Hoa",
             email: "admin@abc.com",
             password: "123456789",
             password_confirmation: "123456789",
             birthday: "21/03/1998",
             role: 2,
             address: "To hieu da nang",
             gender: 2)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456789"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  address = address = Faker::Address.street_address
  User.create!(name: name, email: email, password: password,
               password_confirmation: password,
               birthday: birthday,
               role: 0,
               address: address,
               gender: 1,
               created_at: Time.zone.now)
end

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1+21}@railstutorial.org"
  password = "123456789"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  address = address = Faker::Address.street_address
  User.create!(name: name, email: email, password: password,
               password_confirmation: password,
               birthday: birthday,
               role: 1,
               address: address,
               gender: 0,
               created_at: Time.zone.now)
end
