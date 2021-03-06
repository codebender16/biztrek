Course.destroy_all
User.destroy_all

# Users

admin = User.create(first_name: 'admin', last_name: 'tester', email:'admin@test.com', password: 'password', is_admin: true)
mentor_1 = User.create(first_name: 'Elon', last_name: 'Tusk', email:'mentor_1@test.com', password: 'password', is_mentor: true)
mentor_2 = User.create(first_name: 'Rick', last_name: 'Ricks', email:'mentor_2@test.com', password: 'password', is_mentor: true)
user_1 = User.create(first_name: 'Morty', last_name: 'Clone', email:'user_1@test.com', password: 'password', is_student: true)

# create a cart for student
user_1.create_cart

# Profiles

# mentor_1.create_mentor(description: 'A successful Tusk', expertise: 'Expertise', business: 'Business', industry: 'Industry')

# mentor_2.create_mentor(description: 'A successful grumpy scientist', expertise: 'Expertise', business: 'Business', industry: 'Industry')

# Courses

10.times do 
  course = Course.create(
    title: Faker::Educator.subject, 
    sub_title: Faker::Educator.course_name, 
    price: rand(100..5000), 
    description: Faker::Marketing.buzzwords,
    user_id: rand(1..3)
  )
  # Sample image
  course.image.attach(io: File.open("app/assets/images/biztrek_default.jpg"), filename: "biztrek_default.jpg", content_type: "image/jpg")
end


