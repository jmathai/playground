# A sweet command line blog script

require 'lib/config'
require Config::PathLib + '/error'
require Config::PathLib + '/blog'
case ARGV[0]
  when 'post' then
    b = Blog.new()
    time = ARGV[3].nil? ? time.to_s() : ARGV[3]
    status = b.post(ARGV[1], ARGV[2], time)
    if(status.nil?)
      puts "An error occurred posting to the blog"
    else
      puts "Congrats!"
    end
  when 'view' then
    b = Blog.new()
    posts = b.getPosts()
    if(posts.respond_to?('each'))
      posts.each do |post|
        puts "Author: #{post.author.capitalize()}"
        puts "Body: #{post.body}"
        puts "----------------------------"
      end   
    else
      puts "An error occurred"
    end
  else
    puts "You're using the blog script.  Below you'll find usage information.\n\n"
    puts "Usage:"
    puts "  View"
    puts "    myblogscript.rb view"
    puts "  Post"
    puts "    myblogscript.rb post 'Your Name' 'Body of your post'"
end
