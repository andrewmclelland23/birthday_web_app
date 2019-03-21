class BirthdayCalc
  require 'date'

  def initialize(date_class = Date)
    @date_class = date_class
  end

  def birthday_today?(birthday)
    bday_this_year(birthday) == @date_class.today
  end

  def countdown(birthday)
    bday = bday_this_year(birthday)
    date = @date_class.today
    days_to_bday(bday, date)
  end

  private

  def bday_this_year(date)
    bday = @date_class.strptime(date)
    @date_class.new(@date_class.today.year, bday.month, bday.day)
  end

  def days_to_bday(bday, date)
    if bday > date
      (bday - date).to_i
    else
      (@date_class.new(bday.year + 1, bday.month, bday.day) - date).to_i
    end
  end
end
