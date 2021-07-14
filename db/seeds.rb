# Create a main sample user.
User.create!(name: "Lương Văn Lĩnh",
             email: "admin@abc.com",
             password: "123456789",
             password_confirmation: "123456789",
             birthday: "21/03/1998",
             role: 1,
             address: "Quảng Nam",
             gender: true)

Course.create!(name: "Khóa học Ruby",
               description: "Khóa học dành cho sinh viên",
               start_date: "21/03/2021",
               due_date: "28/06/2021",
               status: 0)

Subject.create!(name_subject: "Học git",
               description: "Bài học nền tảng",
               total_date_lean: 3,
               start_date_learn: "22/08/2021")

# Generate a bunch of additional users.

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456789"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  address = Faker::Address.street_address
  User.create!(name: "User " + name, email: email, password: password,
               password_confirmation: password,
               birthday: birthday,
               role: 1,
               address: address,
               gender: true,
               created_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Name.name
  description = Faker::Name.name
  start_date = Faker::Date.in_date_period
  due_date = Faker::Date.in_date_period
  Course.create!(name: name, description: description,
               start_date: start_date, due_date: due_date,
               status: 0,
               created_at: Time.zone.now)
end

10.times do |n|
  name_subject = Faker::Name.name
  description = Faker::Name.name
  total_date_lean = 1
  start_date_learn = Faker::Date.in_date_period
  Subject.create!(name_subject: name_subject, description: description,
                  total_date_lean: total_date_lean, start_date_learn: start_date_learn,
                  created_at: Time.zone.now)
end

10.times do |n|
  name = Faker::Name.name
  Task.create!(name_task: "Task " + name, subject_id: 1,
               created_at: Time.zone.now)
end
