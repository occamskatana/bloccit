# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 include RandomData

 5.times do 

 	user = User.create!(
 		name: RandomData.random_name, 
 		email: RandomData.random_email, 
 		password: RandomData.random_sentence
 		)
 end

 users = User.all
 
 50.times do 
 	Topic.create!(
 		name: RandomData.random_sentence,
 		description: RandomData.random_paragraph
 		)
 end

 topics = Topic.all

 50.times do
 # #1
   Post.create!(
   	user: users.sample,
 	 topic: topics.sample, 
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 user = User.first

 user.update_attributes!(

 	email: 'johngallweycarter@gmail.com', 
 	password: 'msghguua1!'

 	)
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} Topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"