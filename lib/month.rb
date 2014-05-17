require_relative 'zeller_calculator'

class Month
  attr_accessor :year,
                :month

  MONTH_NAMES           = %w{January February March April May June July August September October November December}
  TOTAL_DAYS_IN_MONTH   = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
  DAYS_IN_EACH_MONTH    = Hash[MONTH_NAMES.zip(TOTAL_DAYS_IN_MONTH)]
  WEEKDAY_ABBREVIATIONS = %w{Su Mo Tu We Th Fr Sa}

  def initialize (month, year)
    self.month = month
    self.year  = Year.new(year)
  end

  def name
    month
  end

  def to_a
    days_of_month            = (1..total_days).to_a
    padding_before_first_day = Array.new(first_day_of_month_index)
    month_array              = padding_before_first_day + days_of_month
    month_array[41]          = nil

    month = []

    month_array.each_slice(7) do |slice|
      month << slice
    end

    month
  end

  protected

  def year=(other)
    fail "cal: year #{other} not in range 1800..3000" if (1800...3000).include? year

    @year = other
  end

  def month=(month)
    # fail "cal: " if !MONTH_LENGTHS.has_key? month and month.to_i.to_s != month
    # fail "cal: year 0 not in range 1..9999" if month.to_i.to_s == month and month.to_i > 12
    is_digits = month.match /\A\d+\z/

    @month = if is_digits
               MONTH_NAMES[month.to_i - 1]
             else
               month
             end
  end

  private

  def first_day_of_month_index
    zeller = ZellerCalculator.new(month, year.to_i).calculate

    zeller == 0  ? 6 : zeller - 1
  end

  def total_days
    if year.leap? && month == 'February' 
      29
    else
      DAYS_IN_EACH_MONTH[month]
    end
  end
end
