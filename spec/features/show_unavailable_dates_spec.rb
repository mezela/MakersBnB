# feature 'show unavailable dates' do
#   scenario 'calendar greys out dates that are not available' do
#     sign_up
#     log_in
#     click_button('Add new listing')
#     create_taj_mahal
#     click_button('Log Out')
#     sign_up_as_pam
#     log_in_as_pam
#     click_button('Book now')
#     click_button("")
#     # expect{select '2020-06-01', :from => '.dropdown'}.to raise_error(Capybara::Poltergeist::MouseEventFailed)
#   end
# end

feature 'show unavailable dates' do
  scenario 'page displays unavailable dates' do
    sign_up
    log_in
    click_button('Add new listing')
    create_taj_mahal
    click_button('Log Out')
    sign_up_as_pam
    log_in_as_pam
    click_button('Book now')
    fill_in('date', with: '2020-06-20')

    click_button('Send Request')
    
    click_button('Log Out')
    log_in
    click_button('View Profile')
    click_button('Confirm')
    expect(page).to have_content('You have confirmed this booking!')
    click_button('Go Back')
    click_button('Log Out')
    sign_up_as_jay
    log_in_as_jay
    click_button('Book now')
    expect(page).to have_content('This property is unavailable on: 2020-06-20')
  end
end
