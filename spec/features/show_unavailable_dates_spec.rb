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
