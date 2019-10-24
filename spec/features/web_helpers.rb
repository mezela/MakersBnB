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

def sign_up_as_pam
  visit '/'
  click_button 'Sign up'
  fill_in "username", with: "pamela"
  fill_in "email", with: "pamsemail"
  fill_in "password", with: "testpassword123"
  click_button 'Create account'
end

def log_in_as_jay
  fill_in "username", with: "jay"
  fill_in "password", with: "password123"
  click_button 'Log in'
end

def sign_up_as_jay
  visit '/'
  click_button 'Sign up'
  fill_in "username", with: "jay"
  fill_in "email", with: "jmail"
  fill_in "password", with: "password123"
  click_button 'Create account'
end

def log_in_as_pam
  fill_in "username", with: "pamela"
  fill_in "password", with: "testpassword123"
  click_button 'Log in'
end

def create_taj_mahal
  fill_in('title', with: 'Taj Mahal')
      fill_in('description', with: 'Looks cool')
      fill_in('pictureurl', with: 'https://thumbs-prod.si-cdn.com/rtkp3HcECC3xlPiOGvSnR1M5Rag=/fit-in/1600x0/filters:focal(1471x1061:1472x1062)/https://public-media.si-cdn.com/filer/b6/30/b630b48b-7344-4661-9264-186b70531bdc/istock-478831658.jpg')
      fill_in('ppn', with: '200')
      fill_in('start_date', with: '2020-05-11')
      fill_in('end_date', with: '2020-07-20')
      click_button('List this space')
end

def create_cool_house
  fill_in('title', with: 'Cool house')
      fill_in('description', with: 'Really cool')
      fill_in('pictureurl', with: 'https://cdn.homedit.com/wp-content/uploads/2017/12/Desai-Chia-Architects-House-with-Cantilevered-Roof-over-patio-300x250.jpg')
      fill_in('ppn', with: '100')
      fill_in('start_date', with: '2020-05-11')
      fill_in('end_date', with: '2020-07-20')
      click_button('List this space')
end
