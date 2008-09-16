class Post
  @id, @author, @body, @time = nil
  attr_accessor :id, :author, :body, :time
  def initialize(id = nil, author = nil, body = nil, time = nil)
    if not id.nil?
      @id = id
    end
    if not author.nil?
      @author = author
    end
    if not body.nil?
      @body = body
    end
    if not time.nil?
      @time = time
    end
  end
end
