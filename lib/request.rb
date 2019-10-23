class Request

  attr_reader :id, :confirmed, :guestID, :propertyID, :ownerID, :date

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

  def self.view_from_guestid(guestID)
    connection = PG.connect(dbname: which_database)
    sql = 'SELECT * FROM requests WHERE guestid=guestID'
    result = connection.exec(sql)
    @results = result.map do |request|
      Property.new(
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
