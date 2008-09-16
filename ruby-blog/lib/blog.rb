# Blog class

require Config::PathLib + '/db'
require Config::PathLib + '/post'
class Blog
  @conn = nil
  def initialize()
    @conn = Db.instance()
    begin
      @conn.connect(Config::DbHost, Config::DbUser, Config::DbPass, Config::DbTable)
    rescue DatabaseConnectionError => error
      #puts error.message
      @conn = nil
    end
  end

  def post(author = nil, body = nil, time = nil)
    if(@conn.nil? or author.nil? or body.nil? or time.nil?)
      return nil
    end

    author = @conn.safe(author)
    body = @conn.safe(body)
    time = @conn.safe(time)
    begin
      @conn.query("INSERT INTO post(author, body, time) VALUES('#{author}', '#{body}', '#{time}')")
      return @conn.affected()
    rescue DatabaseError => error
      #puts error.message
      return nil
    end
  end
  
  def getPosts()
    if(@conn.nil?)
      return nil 
    end
    
    begin
      retval = Array.new()
      res = @conn.query('SELECT * FROM post')
      while(row = res.fetch_hash())
        retval.push(Post.new(row['id'], row['author'], row['body'], row['time']))
      end
      return retval
    rescue DatabaseError => error
      #puts error.message
      return nil
    end
  end
end
