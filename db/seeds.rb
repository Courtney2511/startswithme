# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



30.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  User.create!({ name: user_name, email: user_email, password: 'jiji', password_confirmation: 'jiji' })
end

50.times do
  user = User.order("RANDOM()").first
  body_content = Faker::Lorem.paragraph
  Post.create({ user: user, body: body_content })
end

75.times do
  user = User.order("RANDOM()").first
  comment_comment = Faker::Lorem.sentence
  post = Post.order("RANDOM()").first
  Comment.create({ user: user, comment: comment_comment, post: post })
end
