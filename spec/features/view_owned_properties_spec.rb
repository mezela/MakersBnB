feature 'view owned properties' do
  feature 'a logged in user ' do
    scenario 'can view their properties' do
      sign_up
      log_in
      click_button('Add new listing')
      expect(page).to have_content('List a new Space')
      create_taj_mahal

      click_button('View Profile')
      expect(page).to have_content('Taj Mahal')
      expect(page).to have_content('Looks cool')
      expect(page).to have_css("img[src*='https://thumbs-prod.si-cdn.com/rtkp3HcECC3xlPiOGvSnR1M5Rag=/fit-in/1600x0/filters:focal(1471x1061:1472x1062)/https://public-media.si-cdn.com/filer/b6/30/b630b48b-7344-4661-9264-186b70531bdc/istock-478831658.jpg']")
      expect(page).to have_content('£200')
      expect(page).to have_content('2020-05-11')
      expect(page).to have_content('2020-07-20')
    end

  end

end
