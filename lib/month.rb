require_relative 'zeller_calculator'

class Month
  include Enumerable
  attr_accessor :weeks

  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  MONTH_LENGTHS = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
  SPACES_BEFORE = [6, 0, 1, 2, 3, 4, 5]
  SPACES_AFTER  = [0, 6, 5, 4, 3, 2, 1]
  TOTAL_SPACE = 42

  def initialize (month, year, day = 1)
    @month = month
    @day = day.to_i
    @year = year.to_i
    @start = ZellerCalculator.new(@month, @year).calculate
    @total_days = MONTH_LENGTHS[@month]
    @num_spaces_before = SPACES_BEFORE[@start]
    @weeks = self.build_weeks
  end

  def leap_year?
    (@year % 4 == 0) and !(@year % 100 == 0) || (@year % 400 == 0)
  end
  
  def print_header
    header = "#{@month} #{@year}".center(20).rstrip
    header << "\n"
    header << "Su Mo Tu We Th Fr Sa"
  end

  def build_month
    month_array = []
    total_days = @total_days
    @num_spaces_before.times { month_array << "   " }
    total_days +=1 if self.leap_year? and @month == 'February' 
    total_days.times do |i|
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
    to_go.times { month_array << "   " }
    month_array
  end

  def build_weeks
    quartered_weeks = []
    weeks = self.build_month
    weeks.each_slice(7) do |week|
      quartered_weeks << week
    end
    @weeks = quartered_weeks
  end

  def to_s
    body = print_header
    body << "\n"
    month_array = self.build_month
    month_array.each_slice(7) do |x|
      body << "#{x.join}".rstrip
      body << "\n"
    end
    body
  end

end

