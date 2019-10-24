require 'pg'
require_relative 'choose_database'
require_relative 'property'

class User

  attr_reader :id, :username, :email

  def initialize(id: , username: , email: )
    @id = id
    @username = username
    @email = email
  end

  def self.create(username: ,password: ,email:)
    connection = PG.connect(dbname: which_database)
    if(password.length<8)
      return 'password_length_error'

    elsif((password =~ /\d/)==nil)
      return 'password_safety_error'
    else
      begin
        result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email;")
        User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
      rescue
        return 'unique error'
      end
    end
  end

  def self.all
    connection = PG.connect(dbname: which_database)
    users = connection.exec("SELECT * FROM users;")
    users.map do |user|
      User.new(id: user['id'], username: user['username'] , email: user['email'])
    end
  end

  def self.access_account(username, password)
    begin
      connection = PG.connect(dbname: which_database)
      result = connection.exec("SELECT * FROM users WHERE username ='#{username}' AND password ='#{password}'")
      User.new(id: result[0]['id'], username: result[0]['username'] , email: result[0]['email'])
    rescue
      'invalid login error'
    end
  end


  def self.access_via_id(id)
    connection = PG.connect(dbname: which_database)
    result = connection.exec("SELECT * FROM users WHERE id ='#{id}';")
    User.new(id: result[0]['id'], username: result[0]['username'] , email: result[0]['email'])
  end

  def self.findproperties(id)
    connection = PG.connect(dbname: which_database)
    result = connection.exec("SELECT * FROM properties WHERE ownerid = '#{id}';")
    @results = result.map do |property|
      Property.new(
        id: property['id'],
        ownerID: property['ownerID'],
        title: property['title'],
        address: property['address'],
        description: property['description'],
        picture: property['picture'],
        ppn: property['ppn'],
        start_date: property['start_available_date'],
        end_date: property['end_available_date']
      )
    end
    @results
  end
end
