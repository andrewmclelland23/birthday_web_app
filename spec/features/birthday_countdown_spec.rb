require './lib/birthday_calc.rb'
require './lib/date_convert.rb'

feature 'Birthday countdown' do
  let(:birthday_calc) { BirthdayCalc.new }

  scenario 'Should return bday countdown when the date != inputted birthday' do
    birthday = Date.today + 1
    birthday_string = birthday.strftime('%Y-%m-%d')
    p birthday_string
    visit('/')
    fill_in('name', with: 'Andy')
    fill_in('birthday', with: birthday_string)
    click_button 'Submit'
    expect(page).to have_content "Your birthday will be in 1 day Andy!"
  end
end
