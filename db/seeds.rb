Category.create!(name: "Life")
Category.create!(name: "Tech")
Category.create!(name: "Gadgets")
Category.create!(name: "Music")
Category.create!(name: "Movie")
Category.create!(name: "Travel")

posts = Post.all
5.times do |n|
  post = posts[n+1]
  PopularPost.create!(rank: n+1, post_id: post.id )
end
