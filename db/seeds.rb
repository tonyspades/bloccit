
require 'faker'
 
Post.delete_all
Comment.delete_all

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
com = Comment.all
 

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

 posts.create!(
 	title: "Do The Right Thing",
 	body: "When in doubt scream and shout"
 )

p = posts.last

posts.each do |record|
 Post = posts.all unless p.title == record.title
end

 puts "New Post Added"
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

 com.create!(
 	post: posts.sample,
	body: "Giants have a better team this year"
	)

 c = com.last

 com.each do |comms|
 	Comment = com.all unless c.body == comms.body
 end


 puts "New Comment Added"
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"