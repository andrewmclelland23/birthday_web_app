require './lib/birthday_calc.rb'

describe BirthdayCalc do
  let(:date) { double :date, today: "2019-03-22" }
  let(:date_conv) { double :date_conv }
  subject(:birthday_calc) { described_class.new(date_conv, date) }

  it 'should return true if date passed into birthday_today? method is today' do
    allow(date_conv).to receive(:update_year_to_current) { '2019-03-22' }
    expect(birthday_calc.birthday_today?('2000-03-22')).to eq true
  end

  it 'should return false if date passed into birthday_today? method is not today' do
    allow(date_conv).to receive(:update_year_to_current) { '2019-03-23' }
    expect(birthday_calc.birthday_today?("2000-03-23")).to eq false
  end

  # In both tests below we are substituting dates for integers as bithday_calc will
  # performs calculations that work on Date objects and integers but not strings
  it 'countdown should return no. of days till next bday correctly when next bday is later this year' do
    allow(date_conv).to receive(:update_year_to_current) { 4 }
    allow(date).to receive(:today) { 2 }
    expect(birthday_calc.countdown('2000-03-24')).to eq 2
  end

  it 'countdown should return no. of days till next bday correctly when next bday is next year' do
    allow(date_conv).to receive(:update_year_to_current) { 4 }
    allow(date_conv).to receive(:add_year) { 369 }
    allow(date).to receive(:today) { 8 }
    expect(birthday_calc.countdown("2000-01-25")).to eq 361
  end
end
