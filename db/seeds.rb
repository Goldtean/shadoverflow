10.times {User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password')}

10.times do
  new_answer = Answer.create(content: Faker::Internet.email)
  User.first.answers << new_answer
end

10.times do
  new_question = Question.create(content: Faker::Internet.email)
  User.last.questions << new_question
end
