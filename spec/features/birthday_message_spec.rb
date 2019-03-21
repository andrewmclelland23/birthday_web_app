feature 'Birthday message' do
  scenario 'Should return birthday message when the date = inputted birthday' do
    visit('/')
    fill_in('name', with: 'Andy')
    fill_in('birthday', with: '21/03')
    click_button 'Submit'
    expect(page).to have_content "It's your Birthday today! Happy Birthday Andy!"
  end
end
