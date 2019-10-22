feature 'viewing a user profile' do
  scenario 'a user can view their own profile page' do
  sign_up
  log_in
  click_button 'View Profile'
  expect(page).to have_content "testusername"
  expect(page).to have_content 'testemail'
  expect(page).to have_button 'Go Back'
  end
end
