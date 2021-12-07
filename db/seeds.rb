require 'faker'
puts 'Answers destroy and questions destroy'
Answer.destroy_all
Question.destroy_all
puts 'Voters destroy'
Voter.destroy_all
puts 'Polls destroy'
Poll.destroy_all
puts 'Cleaning database..'
puts "Deleting contact list..."
Contact.destroy_all
puts "All contact destroyed"
puts 'Destroying users...'
User.destroy_all
puts 'Users clean'
puts 'Creating Users..'

ju = User.new(
  {
    email: 'jkmn@protonmail.com',
    password: 'azerty1234',
    username: 'Yuyien'
  }
)
ju.save!
puts "User ju was created with email #{ju.email} and password #{ju.encrypted_password}"

mat = User.new(
  {
    email: 'matth.duperrey@gmail.com',
    password: 'azerty1234',
    username: 'Mat'
  }
)
mat.save!
puts "User mat was created with email #{mat.email} and password #{mat.encrypted_password}"

kate = User.new(
  {
    email: 'cailleret.catherine00@gmail.com',
    password: 'azerty1234',
    username: 'Kate'
  }
)
kate.save!
puts "User kate was created with email #{kate.email} and password #{kate.encrypted_password}"



puts "Creating 10 contacts for ju"
10.times do
  Contact.new(
    {
      user_id: ju.id,
      email: Faker::Internet.email,
      first_name: Faker::Name.name,
      last_name: Faker::Artist.name
    }
  ).save!
end

puts "Creating 10 contacts for mat"
10.times do
  Contact.new(
    {
      user_id: mat.id,
      email: Faker::Internet.email,
      first_name: Faker::Name.name,
      last_name: Faker::Artist.name
    }
  ).save!
end

puts "Creating 10 contacts for kate"
10.times do
  Contact.new(
    {
      user_id: kate.id,
      email: Faker::Internet.email,
      first_name: Faker::Name.name,
      last_name: Faker::Artist.name
    }
  ).save!
end
puts "Contacts created with success !"




puts "Create a poll 1"

poll_one = Poll.new(

  {
    user_id: kate.id,
    name: "Budget 2022",
    status: "PENDING",
    expiry_date: Time.now + (1 * 60 * 60),
    deletion_date: Time.now + (24 * 60 * 60)
  }
)
poll_one.save!

10.times do
  Voter.new(
    {
      email: Faker::Internet.email,
      token: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true),
      poll_id: poll_one.id
    }
  ).save!
end

question_one = Question.new(
  {
    poll_id: poll_one.id,
    title: "Question 1",
    content: "Devrait t'on augmenter le budget café, Redbull et Xanax du service Web Dev ?",
    mandatory: true,
    question_type: "UNIQUE"
  }
)
question_one.save!

question_two = Question.new(
  {
    poll_id: poll_one.id,
    title: "Question 2",
    content: "Devrait t-on embaucher un cuisiner pour que Camille ne mange plus ses
    'pic&kroq' ainsi que ses pompottes à midi ?",
    mandatory: false,
    question_type: "UNIQUE"
  }
)
question_two.save!

answer_one = Answer.new(
  {
    question_id: question_one.id,
    content: "oui"
  }
)
answer_one.save!

answer_two = Answer.new(
  {
    question_id: question_one.id,
    content: "non"
  }
)
answer_two.save!

puts "Create a poll 2"

poll_2 = Poll.new(

  {
    user_id: ju.id,
    name: "Menu de la cantine",
    status: "PENDING",
    expiry_date: Time.now + (1 * 60 * 60),
    deletion_date: Time.now + (24 * 60 * 60)
  }
)
poll_2.save!

10.times do
  Voter.new(
    {
      email: Faker::Internet.email,
      token: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true),
      poll_id: poll_2.id
    }
  ).save!
end



question_three = Question.new(
  {
    poll_id: poll_2.id,
    title: "Question 1",
    content: "Doit arrêter de servir la soupe à la cantine avec les poils de Momo à l'intérieur ?",
    mandatory: true,
    question_type: "UNIQUE"
  }
)
question_three.save!

question_four = Question.new(
  {
    poll_id: poll_2.id,
    title: "Question 2",
    content: "Doit t on virer Momo ?",
    mandatory: false,
    question_type: "UNIQUE"
  }
)
question_four.save!


answer_three = Answer.new(
  {
    question_id: question_three.id,
    content: "oui"
  }
)
answer_three.save!

answer_four = Answer.new(
  {
    question_id: question_four.id,
    content: "oui"
  }
)
answer_four.save!

puts "Poll 1 and 2 create with success"
