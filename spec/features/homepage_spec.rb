feature 'Homepage' do
  scenario 'Should display the welcome message' do
    visit('/')
    expect(page).to have_content 'Hello! Please enter your birthday below...'
  end
end
