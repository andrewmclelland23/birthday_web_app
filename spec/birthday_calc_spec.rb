require './model/birthday_calc.rb'

describe BirthdayCalc do
  let(:date_class) { double :date_class, today: Date.new(2019, 03, 21) }
  let(:date) { double :date }
  subject(:birthday_calc) { described_class.new(date_class) }

  it 'should return true if date passed into birthday_today? method is today' do
    allow(date_class).to receive(:strptime) { Date.new(2000, 03, 21) }
    allow(date_class).to receive(:new) { Date.new(2019, 03, 21) }
    expect(birthday_calc.birthday_today?("2000-03-21")).to eq true
  end

  it 'should return false if date passed into birthday_today? method is not today' do
    allow(date_class).to receive(:strptime) { Date.new(2000, 03, 23) }
    allow(date_class).to receive(:new) { Date.new(2019, 03, 23) }
    expect(birthday_calc.birthday_today?("2000-03-23")).to eq false
  end

  it 'countdown should return no. of days till next bday correctly when next bday is later this year' do
    allow(date_class).to receive(:strptime) { Date.new(2000, 03, 23) }
    allow(date_class).to receive(:new) { Date.new(2019, 03, 23) }
    expect(birthday_calc.countdown("2000-03-23")).to eq 2
  end

  it 'countdown should peform 2nd branch of conditional when next bday is in next year' do
    allow(date_class).to receive(:strptime) { Date.new(2000, 01, 25) }
    allow(date_class).to receive(:new) { Date.new(2019, 01, 25) }
    expect(birthday_calc.countdown("2000-01-25")).to eq(-55)
  end
end
