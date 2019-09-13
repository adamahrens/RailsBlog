require 'faker'

5.times do
  User.create(username: Faker::Internet.username, email: Faker::Internet.email)
end

8.times do
  user = User.order('RANDOM()').first
  Article.create(title: Faker::Movies::Ghostbusters.character,
                 description: Faker::Movies::Ghostbusters.quote,
                 user: user)
end

10.times do
  user = User.order('RANDOM()').first
  Article.create(title: Faker::GreekPhilosophers.name,
                 description: Faker::GreekPhilosophers.quote,
                 user: user)
end
