require 'faker'

8.times {
  Article.create(title: Faker::Movies::Ghostbusters.character,
                 description: Faker::Movies::Ghostbusters.quote)
}

10.times {
  Article.create(title: Faker::GreekPhilosophers.name,
                 description: Faker::GreekPhilosophers.quote)
}
