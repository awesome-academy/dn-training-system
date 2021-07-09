# Create a main sample user.
User.create!(name: "Nguyen Quoc Hoa",
             email: "admin@abc.com",
             password: "123456789",
             password_confirmation: "123456789",
             birthday: "21/03/1998",
             role: 1,
             address: "To hieu da nang",
             gender: "true")

# Generate a bunch of additional users.

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456789"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  address = address = Faker::Address.street_address
  User.create!(name: name, email: email, password: password,
               password_confirmation: password,
               birthday: birthday,
               role: 1,
               address: address,
               gender: "true",
               created_at: Time.zone.now)
end

