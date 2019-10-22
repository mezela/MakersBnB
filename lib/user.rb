require 'pg'
require_relative 'choose_database'

class User

  attr_reader :id, :username, :email

  def initialize(id: , username: , email: )
    @id = id
    @username = username
    @email = email
  end

  def self.create(username: ,password: ,email:)
    connection = PG.connect(dbname: which_database)
    result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.all
    connection = PG.connect(dbname: which_database)
    users = connection.exec("SELECT * FROM users;")
    users.map do |user|
      User.new(id: user['id'], username: user['username'] , email: user['email'])
    end
  end

end
