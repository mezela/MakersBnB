feature 'account creation' do
  scenario 'a new user is taken to the account creation page when they click a button' do
    visit '/'
    click_button 'Sign up'
    expect(page).to have_content 'Please enter your details in the fields below'
  end
  scenario 'a user is redirected to the homepage ionce they enter new account details' do
    visit '/'
    click_button 'Sign up'
    click_button 'Create account'
    expect(current_path).to eq('/')
  end
end
