# Year
#   Stores an array of Month
# YearFormatter
#   Take an array of Months
#   Go through each array
#   Generate the string
#   Return it
# Month
#   Array of arrays of days
# MonthFormatter
#   Take a Month
#   Grab the array of arrays of days
#   Generate a single string from that array
#   Return it
# ZellerCalculator
#   Give it month and year and it returns the zeller month/year

class ZellerCalculator
  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  attr_accessor :original_month,
                :original_year,
                :original_day

  def initialize(month, year, day = 1)
    #self.original_month = month
    self.original_year = year
    self.original_day = day
    self.original_month = MONTHS.each_index.find { |index| MONTHS[index] == month }
  end

  def calculate
    calculated_day = original_day
    calculated_month = ((zeller_month + 1) * 26) / 10
    calculated_year = zeller_year + (zeller_year / 4) + 6 * (zeller_year / 100) + (zeller_year / 400)

    (calculated_day + calculated_month + calculated_year) % 7
  end

  private

  def zeller_year
    if zeller_month == 13 || zeller_month == 14
      original_year - 1
    else
      original_year
    end
  end

  def zeller_month
    if original_month < 2
      original_month + 13
    else
      original_month + 1
    end
  end
end

################################################################################################

class Month
  include Enumerable

  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  MONTH_LENGTHS = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
  SPACES_BEFORE = [6, 0, 1, 2, 3, 4, 5]
  SPACES_AFTER  = [0, 6, 5, 4, 3, 2, 1]
  TOTAL_SPACE = 42

  attr_accessor :month
  attr_reader :start

  def initialize (month, year, day = 1)
    @month = month
    @day = day.to_i
    @year = year.to_i
    @start = ZellerCalculator.new(@month, @year).calculate
    @total_days = MONTH_LENGTHS[@month]
    @num_spaces_before = SPACES_BEFORE[@start]
    @month_array = self.prep_month
  end

  def leap_year?
    (@year % 4 == 0) and !(@year % 100 == 0) || (@year % 400 == 0)
  end

  def prep_month
    month_array = []
    header = "#{@month} #{@year}".center(20).rstrip
    puts "#{header}"
    days = 'Su Mo Tu We Th Fr Sa'
    puts "#{days}"
    @num_spaces_before.times do
      month_array << "   "
    end
    build_month month_array
  end

  def build_month(month_array)
    @total_days += 1 if self.leap_year? and @month == 'February' 

    @total_days.times do |i|
      if i < 9
        month_array << " #{i + 1} "
      else
        month_array << "#{i + 1} "
      end
    end
    fill_in_remaining month_array
  end

  def fill_in_remaining(month_array) 
    filled_in_currently = @total_days + @num_spaces_before
    to_go = TOTAL_SPACE - filled_in_currently
    to_go.times do
      month_array << "   "
    end
    @month_array = month_array
  end

  def to_s
    @month_array = @month_array.each_slice(7) do |x|
      puts "#{x.join}".rstrip
    end
  end

end

