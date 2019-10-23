def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in "username", with: "testusername"
  fill_in "email", with: "testemail"
  fill_in "password", with: "testpassword123"
  click_button 'Create account'
end

def log_in
  fill_in "username", with: "testusername"
  fill_in "password", with: "testpassword123"
  click_button 'Log in'
end
