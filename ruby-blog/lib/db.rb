require 'singleton'
require 'mysql'

class Db
  include Singleton
  @conn = nil
  attr_accessor :conn
  
  def connect(host, user, pass, table)
    @conn = Mysql.real_connect(host, user, pass, table)
  end

  def query(sql)
    @conn.query(sql)
  end

  def safe(str)
    @conn.escape_string(str)
  end

  def affected()
    @conn.affected_rows()
  end
end
