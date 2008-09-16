require 'lib/config'
require 'lib/blog'
b = Blog.new()
case ARGV[0]
  when 'post' then
    if ARGV[3].nil?
      time = time.to_s()
    elsif
      time = ARGV[3]
    end
    postId = b.post(ARGV[1], ARGV[2], time)
    post = b.getById(postId)
    puts "You created a blog post"
    puts "Author: #{post.author.capitalize()}"
    puts "Body: #{post.body}"
  else
    posts = b.getPosts()
    posts.each do |post|
      puts "Author: #{post.author.capitalize()}"
      puts "Body: #{post.body}"
      puts "----------------------------"
    end   
end
