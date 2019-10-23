require 'property'

describe Property do

  subject(:property) {described_class.new(
    id: 1,
    ownerID: 5,
    title: 'Cool test house',
    address: '64 zoo lane',
    description: "It is a house and it is really cool but it is also just a test",
    picture: 'www.pictureofacoolhouse.com',
    ppn: 50,
    start_date: '2020-01-01',
    end_date: '2020-02-01'
    )}

  describe 'initialization' do
     it 'initializes with an ID, image, description, title, ppn, start date and end date' do
      expect(property.id).to eq(1)
      expect(property.ownerID).to eq(5)
      expect(property.title).to eq('Cool test house')
      expect(property.address).to eq('64 zoo lane')
      expect(property.description).to eq("It is a house and it is really cool but it is also just a test")
      expect(property.picture).to eq('www.pictureofacoolhouse.com')
      expect(property.ppn).to eq(50)
      expect(property.start_date).to eq('2020-01-01')
      expect(property.end_date).to eq('2020-02-01')
   end
  end

  describe '#view_all' do
    it 'shows and empty array when there are no properties listed' do
      expect(Property.view_all).to eq []
    end
  end

  describe '#add' do
    it 'can add a new proprty to the database' do
      Property.add(
      ownerID: 5,
      title: 'Cool test house',
      address: '64 zoo lane',
      description: "It is a house and it is really cool but it is also just a test",
      picture: 'www.pictureofacoolhouse.com',
      ppn: 50,
      start_date: '2020-01-01',
      end_date: '2020-02-01')
      expect(Property.view_all.length).to eq 1
      expect(Property.view_all.first).to be_instance_of Property
    end
  end
end
