feature 'create a listing' do
  scenario 'user can create a listing' do
    visit('/listings')
    click_button('Add new listing')
    expect(page).to have_content('List a new Space')
    fill_in('title', with: 'Taj Mahal')
    fill_in('description', with: 'Looks cool')
    fill_in('pictureurl', with: 'https://thumbs-prod.si-cdn.com/rtkp3HcECC3xlPiOGvSnR1M5Rag=/fit-in/1600x0/filters:focal(1471x1061:1472x1062)/https://public-media.si-cdn.com/filer/b6/30/b630b48b-7344-4661-9264-186b70531bdc/istock-478831658.jpg')
    fill_in('ppn', with: '200')
    fill_in('start_date', with: '2020-05-11')
    fill_in('end_date', with: '2020-07-20')
    click_button('List this space')
    expect(page).to have_content('Taj Mahal')
    expect(page).to have_content('Looks cool')
    expect(page).to have_css("img[src*='https://thumbs-prod.si-cdn.com/rtkp3HcECC3xlPiOGvSnR1M5Rag=/fit-in/1600x0/filters:focal(1471x1061:1472x1062)/https://public-media.si-cdn.com/filer/b6/30/b630b48b-7344-4661-9264-186b70531bdc/istock-478831658.jpg']")
    expect(page).to have_content('£200')
    expect(page).to have_content('2020-05-11')
    expect(page).to have_content('2020-07-20')
  end
end