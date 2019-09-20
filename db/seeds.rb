require 'faker'

5.times do
  username = Faker::Internet.username
  username += '!' * 3 if username.length < 5
  User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
  puts 'Creating Users'
end

8.times do
  user = User.order('RANDOM()').first
  Article.create(title: Faker::Movies::Ghostbusters.character,
                 description: Faker::Movies::Ghostbusters.quote,
                 user: user)
  puts 'Creating Articles with Ghostbusters'
end

10.times do
  user = User.order('RANDOM()').first
  Article.create(title: Faker::GreekPhilosophers.name,
                 description: Faker::GreekPhilosophers.quote,
                 user: user)
  puts 'Create Articles with Greek Philosophers'
end
