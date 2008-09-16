# Database abstraction which uses ruby-mysql

require 'singleton'
require 'mysql'

class Db
  include Singleton
  @conn = nil
  attr_accessor :conn
  
  def connect(host, user, pass, table)
    begin
      @conn = Mysql.real_connect(host, user, pass, table)
    rescue Mysql::Error => error
      @conn = nil
      raise DatabaseConnectionError, "Database connection error occurred: #{error.message}"
    end
  end

  def query(sql)
    if(@conn.nil?)
      raise DatabaseError, "No database connection found for function query()"
    end

    begin
      @conn.query(sql)
    rescue Mysql::Error => error
      raise DatabaseQueryError, "Database query error occurred: #{error.message}"
    end
  end

  def safe(str)
    if(@conn.nil?)
      raise DatabaseError, "No database connection found for function sare()"
    end

    @conn.escape_string(str)
  end

  def affected()
    if(@conn.nil?)
      raise DatabaseError, "No database connection found for function affected()"
    end

    @conn.affected_rows()
  end
end
