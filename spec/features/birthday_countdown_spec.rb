feature 'Birthday countdown' do
  scenario 'Should return birthday countdown when the date != inputted birthday' do
    visit('/')
    fill_in('name', with: 'Andy')
    fill_in('birthday', with: '25/07/1801')
    click_button 'Submit'
    expect(page).to have_content "Your birthday will be in 126 days Andy!"
  end
end
