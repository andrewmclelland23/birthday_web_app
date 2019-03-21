feature 'Birthday countdown' do
  scenario 'Should return birthday countdown when the date != inputted birthday' do
    visit('/')
    fill_in('name', with: 'Andy')
    fill_in('birthday', with: '1801-07-25')
    click_button 'Submit'
    expect(page).to have_content "Your birthday will be in 126 days Andy!"
  end
end
