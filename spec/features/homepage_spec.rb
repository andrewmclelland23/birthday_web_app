feature 'Homepage' do
  scenario 'Should display the welcome message' do
    visit('/')
    expect(page).to have_content 'Hello! Please enter your name and birthday below...'
  end
end
