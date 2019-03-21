class BirthdayCalc
  require 'date'

  def birthday_today?(birthday)
    bday_this_year(birthday) == Date.today
  end

  def countdown(birthday)
    bday = bday_this_year(birthday)
    date = Date.today
    if bday > date
      (bday - date).to_i
    else
      (Date.new(bday.year + 1, bday.month, bday.day) - date).to_i
    end
  end

  private

  def bday_this_year(date)
    Date.strptime(date, '%d/%m')
  end

end
