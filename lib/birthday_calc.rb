class BirthdayCalc
  require 'time'
  require_relative 'date_convert'

  def initialize(date_conv = DateConvert.new, date = Date)
    @date_conv = date_conv
    @date = date
  end

  def birthday_today?(birthday)
    @date_conv.update_year_to_current(birthday) == @date.today
  end

  def countdown(birthday)
    bday_this_year = @date_conv.update_year_to_current(birthday)
    today = @date.today
    days_to_bday(bday_this_year, today)
  end

  private

  def days_to_bday(bday, today)
    bday > today ? date_diff(bday, today) : date_diff(@date_conv.add_year(bday), today)
  end

  def date_diff(date1, date2)
    (date1 - date2).to_i
  end

end
