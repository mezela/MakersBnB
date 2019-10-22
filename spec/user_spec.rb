require 'user'

describe User do

describe '.all' do
  it 'saves user details in a database' do
    user = User.create(username: "Namast-Jay", password:"password123", email: "jaydamasta@hotmail.com")
    users = [user]
    expect(users.first).to be_a User
    expect(users.first.id).to eq user.id
    expect(users.first.username).to eq('Namast-Jay')
    expect(users.first.email).to eq('jaydamasta@hotmail.com')
  end

end

describe '.create' do
  it 'user is created with username, password and email' do
    user = User.create(username: "Namast-Jay", password:"password123", email: "jaydamasta@hotmail.com")
    expect(user).to be_a User
    expect(user.username).to eq('Namast-Jay')
    expect(user.email).to eq('jaydamasta@hotmail.com')
  end
end



end
