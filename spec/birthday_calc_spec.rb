require './model/birthday_calc.rb'

describe BirthdayCalc do
  let(:date_class) { double :date_class, new: date}
  let(:date) { double :date}
  subject(:birthday_calc) { described_class.new(date_class) }

  it 'should return true if date passed into birthday_today? method is today' do
    allow(date_class).to receive(:strptime) { "21/03/2019" }
    allow(date_class).to receive(:today) { "21/03/2019" }
    expect(birthday_calc.birthday_today?("21/03/2000")).to eq true
  end

  it 'should return false if date passed into birthday_today? method is not today' do
    allow(date_class).to receive(:strptime) { "23/03/2019" }
    allow(date_class).to receive(:today) { "21/03/2019" }
    expect(birthday_calc.birthday_today?("23/03/2000")).to eq false
  end

  it 'countdown should return no. of days till next bday correctly when next bday is later this year' do
    # Below simulates a birthday which will occur in 2 days
    allow(date_class).to receive(:strptime) { 10 }
    allow(date_class).to receive(:today) { 8 }
    expect(birthday_calc.countdown("anything")).to eq 2
  end

  it 'countdown should return no. of days till next bday correctly when next bday is in next year' do
    # Below simulates a birthday which will occur in 5 days
    allow(date_class).to receive(:new) { 15 }
    allow(date_class).to receive(:strptime) { 15 }
    allow(date_class).to receive(:today) { 10 }
    expect(birthday_calc.countdown("anything")).to eq 5
  end
end
