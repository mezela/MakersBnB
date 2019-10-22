feature 'account creation' do

  scenario 'a new user is taken to the account creation page when they click a button' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Please enter your details in the fields below'
  end

  scenario 'a user is redirected to the homepage once they enter new account details' do
    visit '/'
    click_button 'Sign up'
    fill_in "username", with: "testusername"
    fill_in "email", with: "testemail"
    fill_in "password", with: "testpassword123"
    click_button 'Create account'
    expect(current_path).to eq('/')
  end

  scenario 'notification shown if password too short' do
    visit '/'
    click_button 'Sign up'
    fill_in "username", with: "testusername"
    fill_in "email", with: "testemail"
    fill_in "password", with: "123"
    click_button 'Create account'
    expect(page).to have_content 'Password too short'
  end

  scenario 'notification shown if password too short' do
    visit '/'
    click_button 'Sign up'
    fill_in "username", with: "testusername"
    fill_in "email", with: "testemail"
    fill_in "password", with: "loooongpassswoooord"
    click_button 'Create account'
    expect(page).to have_content "Password must contain a number"
  end


end
