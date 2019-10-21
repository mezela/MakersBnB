require_relative 'choose_database'
require 'pg'

class Property

  attr_reader :id, :ownerID, :title, :description, :picture, :ppn, :start_date, :end_date

  def initialize(
    id: id,
    ownerID: ownerID,
    title: title,
    description: description,
    picture: picture,
    ppn: ppn,
    start_date: start_date,
    end_date: end_date
  )
    @id = id
    @ownerID = ownerID
    @title = title
    @description = description
    @picture = picture
    @ppn = ppn
    @start_date = start_date
    @end_date = end_date
  end

  def self.view_all
    connection = PG.connect(dbname: which_database)
    sql = 'SELECT * FROM properties'
    result = connection.exec(sql)
    @results = result.map do |property|
      Property.new(
        id: property['id'],
        ownerID: property['ownerID'],
        title: property['title'],
        description: property['description'],
        picture: property['picture'],
        ppn: property['ppn'],
        start_date: property['start_available_date'],
        end_date: property['end_available_date']
      )
    end
  @results
  end

  def self.add(
    ownerID: ownerID,
    title: title,
    description: description,
    picture: picture,
    ppn: ppn,
    start_date: start_date,
    end_date: end_date)
    connection = PG.connect(dbname: which_database)
    sql = "INSERT INTO properties (ownerID, title, description, picture, ppn, start_available_date, end_available_date) VALUES('#{ownerID}','#{title}','#{description}','#{picture}','#{ppn}','#{start_date}','#{end_date}');"
    connection.exec(sql)
  end
end
