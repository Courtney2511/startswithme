# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


#
#
30.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  User.create!({ name: user_name, email: user_email, password: 'jiji', password_confirmation: 'jiji' })
end

User.all.each do |user|
  image_number = Random.rand(3..70)
  user.profile_picture = Rails.root.join("app/assets/images/#{"%02d" % image_number}.RandomImagesO2-UWTB.PNG").open
  user.save
end

40.times do
  title_sentence = Faker::Lorem.sentence
  random_user = User.order("RANDOM()").first
  post = Post.create({ user: random_user, title: title_sentence, body: nil })
end

100.times do
  user = User.order("RANDOM()").first
  post = Post.order("RANDOM()").first
  comment_comment = Faker::Lorem.sentence
  Comment.create({ user: user, comment: comment_comment, post: post })
end

30.times do
  # user = User.order("RANDOM()").first
  # body_content = Faker::Lorem.paragraph
  image_number = Random.rand(3..70)
  post_number = Post.order("RANDOM()").first
  post = Post.find(post_number)
  post.image = Rails.root.join("app/assets/images/#{"%02d" % image_number}.RandomImagesO2-UWTB.PNG").open
  post.save!
end
