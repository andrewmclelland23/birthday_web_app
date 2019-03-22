require './lib/birthday_calc.rb'
require './lib/date_convert.rb'

feature 'Birthday message' do
  let(:birthday_calc) { BirthdayCalc.new }
  scenario 'Should return birthday message when the date = inputted birthday' do
    birthday_string = Date.today.strftime('%Y-%m-%d')
    visit('/')
    fill_in('name', with: 'Andy')
    fill_in('birthday', with: birthday_string)
    click_button 'Submit'
    expect(page).to have_content "It's your Birthday today! Happy Birthday Andy!"
  end
end
