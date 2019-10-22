feature 'viewing a user profile' do
  scenario 'a user can view their own profile page' do
  visit '/'
  click_button 'Sign up'
  fill_in "username", with: "testusername"
  fill_in "email", with: "testemail"
  fill_in "password", with: "testpassword123"
  click_button 'Create account'
  fill_in "username", with: "testusername"
  fill_in "password", with: "wrongpassword123"
  click_button 'Log in'
  click_button 'View my profile'
  expect(page).to have_content "testusername's profile"
  expect(page).to have_content 'testemail'
  expect(page).to have_button 'Back'
  end
end
