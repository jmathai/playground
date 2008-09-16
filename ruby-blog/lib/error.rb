# A few custom exceptions 

class EpiError < StandardError
end

class DatabaseError < EpiError
end

class DatabaseConnectionError < DatabaseError
end

class DatabaseQueryError < DatabaseError
end

class BlogPostError < EpiError
end
