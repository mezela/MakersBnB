class Request

  attr_reader :id, :confirmed, :guestID, :propertyID, :ownerID, :date, :confirmed

  def initialize(id:, guestID:, ownerID:, propertyID:, date:, confirmed:)
    @id = id
    @confirmed = confirmed
    @guestID = guestID
    @propertyID = propertyID
    @ownerID = ownerID
    @date = date
  end

  def self.add(guestID: , ownerID: , propertyID: , date:)
    connection = PG.connect(dbname: which_database)
    sql = "INSERT INTO requests
    (ownerid, guestid, propertyid, date)
    VALUES('#{ownerID}','#{guestID}','#{propertyID}','#{date}')
    RETURNING id, ownerid, propertyid, date, confirmed
    ;"
    result = connection.exec(sql)
    request = Request.new(id: result[0]['id'],
      guestID: result[0]['guestID'],
      ownerID: result[0]['ownerID'] ,
      propertyID: result[0]['propertyID'] ,
      date: result[0]['date'],
      confirmed: result[0]['confirmed'])
    return request
  end

  def self.view_all
    connection = PG.connect(dbname: which_database)
    sql = "SELECT * FROM requests;"
    result = connection.exec(sql)
    @results = result.map do |request|
      Request.new(
        id: request['id'],
        guestID: request['guestid'],
        ownerID: request['ownerid'] ,
        propertyID: request['propertyid'] ,
        date: request['date'],
        confirmed: request['confirmed'])
      end
    @results
  end

  def self.view_from_guestid(guestid)
    connection = PG.connect(dbname: which_database)
    sql = "SELECT * FROM requests WHERE guestid=#{guestid};"
    result = connection.exec(sql)
    @results = result.map do |request|
      Request.new(
        id: request['id'],
        guestID: request['guestid'],
        ownerID: request['ownerid'] ,
        propertyID: request['propertyid'] ,
        date: request['date'],
        confirmed: request['confirmed'])
      end
    @results
  end

  def self.view_from_ownerid(ownerid)
    connection = PG.connect(dbname: which_database)
    sql = "SELECT * FROM requests WHERE ownerid=#{ownerid};"
    result = connection.exec(sql)
    @results = result.map do |request|
      Request.new(
        id: request['id'],
        guestID: request['guestid'],
        ownerID: request['ownerid'] ,
        propertyID: request['propertyid'] ,
        date: request['date'],
        confirmed: request['confirmed'])
      end
    @results
  end

  def self.confirm(id)
    connection = PG.connect(dbname: which_database)
    sql = "UPDATE requests SET confirmed='TRUE' WHERE id=#{id};"
    connection.exec(sql)
  end

  def self.delete(id)
    connection = PG.connect(dbname: which_database)
    sql = "DELETE FROM requests WHERE id=#{id};"
    connection.exec(sql)
  end

  def self.view_all_requests(propid)
    connection = PG.connect(dbname: which_database)
    sql = "SELECT * FROM requests WHERE propertyid=#{propid} AND confirmed='TRUE'"
    result = connection.exec(sql)
    @results = result.map do |request|
      Request.new(
        id: request['id'],
        guestID: request['guestid'],
        ownerID: request['ownerid'] ,
        propertyID: request['propertyid'] ,
        date: request['date'],
        confirmed: request['confirmed'])
      end
    @results
  end



end
