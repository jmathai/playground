require Config::PathLib + '/db'
require Config::PathLib + '/post'
class Blog
  @conn = nil
  def initialize()
    @conn = Db.instance()
    @conn.connect('localhost', 'root', '', 'blog')
    puts @conn
  end

  def post(author = nil, body = nil, time = nil)
    if(not author.nil? and not body.nil? and not time.nil?)
      author = @conn.safe(author)
      body = @conn.safe(body)
      time = @conn.safe(time)
      res = @conn.query("INSERT INTO post(author, body, time) VALUES('#{author}', '#{body}', '#{time}')")
      puts @conn.affected()
    end
  end
  
  def getPosts()
    retval = Array.new()
    res = @conn.query('SELECT * FROM post')
    while(row = res.fetch_hash())
      retval.push(Post.new(row['id'], row['author'], row['body'], row['time']))
    end
    return retval
  end
end
