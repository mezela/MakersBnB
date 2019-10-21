require 'property'

describe Property do

  subject(:property) {described_class.new(
    id: 1,
    title: 'Cool test house',
    description: "It's a house and it's really cool but it's also just a test",
    picture: 'www.pictureofacoolhouse.com',
    ppn: 50,
    start_date: 2020-01-01,
    end_date: 2020-02-01
    )}

  describe 'initialization' do
     it 'initializes with an ID, image, description, title, ppn, start date and end date' do
      expect(property.id).to eq(1)
      expect(property.title).to eq('Cool test house')
      expect(property.description).to eq("It's a house and it's really cool but it's also just a test")
      expect(property.picture).to eq('www.pictureofacoolhouse.com')
      expect(property.ppn).to eq(50)
      expect(property.start_date).to eq(2020-01-01)
      expect(property.end_date).to eq(2020-02-01)
   end
  end

  describe '#view_all' do
    it 'shows and empty array when there are no properties listed' do
      expect(Property.view_all).to eq []
    end
  end

end
