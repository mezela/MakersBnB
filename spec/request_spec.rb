describe Request do
  subject(:request) {described_class.new(id: 1,
  guestID: 2,
  ownerID: 3,
  propertyID: 4,
  date: '2020-10-10',
  confirmed: "f")}

  it 'initializes with an id, guestid, ownerid, propertyid, date, and confirmation' do
    expect(subject.id).to eq 1
    expect(subject.guestID).to eq 2
    expect(subject.ownerID).to eq 3
    expect(subject.propertyID).to eq 4
    expect(subject.date).to eq '2020-10-10'
    expect(subject.confirmed).to eq 'f'
  end

  describe '#add' do
    it "adds a request to the database" do
      Request.add(
        guestID: subject.guestID,
        ownerID: subject.ownerID,
        propertyID: subject.propertyID,
        date: subject.date,
      )
      expect(Request.view_all.length).to eq 1
      expect(Request.view_all[0].class).to eq Request
    end
  end

  describe '#view_all' do
    it "will show an empty array when no requests have been made" do
      expect(Request.view_all).to eq []
    end
  end

  describe '#view_from_ownerid' do

    before do
      Request.add(
      guestID: subject.guestID,
      ownerID: subject.ownerID,
      propertyID: subject.propertyID,
      date: subject.date,
    )
  end

    it "will show an empty array when no requests for a certain users property have been made" do
      expect(Request.view_from_ownerid(10)).to eq []
    end

    it "well show the requests for a certain owners properties" do
      expect(Request.view_from_ownerid(3).length).to eq 1
      expect(Request.view_from_ownerid(3)[0].class).to eq Request
    end

  end

  describe '#view_from_guestid' do

    before do
      Request.add(
      guestID: subject.guestID,
      ownerID: subject.ownerID,
      propertyID: subject.propertyID,
      date: subject.date,
    )
  end

    it "will show an empty array when no requests for a certain users property have been made" do
      expect(Request.view_from_guestid(10)).to eq []
    end

    it "well show the requests for a certain owners properties" do
      expect(Request.view_from_guestid(2).length).to eq 1
      expect(Request.view_from_guestid(2)[0].class).to eq Request
    end

  end


end
