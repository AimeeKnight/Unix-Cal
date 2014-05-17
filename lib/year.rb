class Year
  MONTHS = %w{January February March April May June July August September October November December}

  attr_accessor :year

  def initialize year
    self.year = year
  end

  def months
    @months ||= MONTHS.map do |month_name|
                  Month.new(month_name, year)
                end
  end

  def to_i
    year.to_i
  end

  def leap?
    (year % 4 == 0) and !(year % 100 == 0) || (year % 400 == 0)
  end

  def to_s
    year.to_s
  end
end
