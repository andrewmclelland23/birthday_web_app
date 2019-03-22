class DateConvert
  require 'date'

  def initialize(date = Date)
    @date = date
  end

  def update_year_to_current(date)
    date = string_to_date(date)
    current_year = @date.today.year
    @date.new(current_year, date.month, date.day)
  end

  def add_year(date)
    @date.new(date.year + 1, date.month, date.day)
  end

  private

  def string_to_date(date_string)
    @date.strptime(date_string)
  end

end
