# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  firstName: 'Edwin',
  lastName: 'Carbajal',
  username: 'edwincarbajal',
  email: 'exaviercarbajal@gmail.com',
  password: 'password',
  photoURL: Faker::Avatar.image,
  headline: 'Founder @Frameworkstash',
  uid: '',
  providerId: '',
)

5.times do
  Framework.create!(
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence
  )
end

10.times do
  Tutorial.create!(
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    website: Faker::Internet.url,
    skill_level: Faker::Lorem.word,
    framework: Framework.all.sample,
    hunter: User.first,
    author: User.first
  )
end
