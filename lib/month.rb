require_relative 'zeller_calculator'

class Month
  include Enumerable
  attr_accessor :weeks,
                :year,
                :month,
                :day,
                :start,
                :total_days,
                :num_spaces_before,
                :weeks

  MONTH_LENGTHS = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
  SPACES_BEFORE = [6, 0, 1, 2, 3, 4, 5]
  TOTAL_SPACE = 42

  def initialize (month, year, day = 1)
    self.month = month
    self.day = day.to_i
    self.year = year.to_i
    self.start = ZellerCalculator.new(self.month, self.year).calculate
    self.total_days = MONTH_LENGTHS[self.month]
    self.num_spaces_before = SPACES_BEFORE[self.start]
    self.weeks = self.build_weeks
  end

  def leap_year?
    (year % 4 == 0) and !(year % 100 == 0) || (year % 400 == 0)
  end

  def print_header
    header = "#{month} #{year}".center(20).rstrip
    header << "\n"
    header << "Su Mo Tu We Th Fr Sa"
  end

  def build_month
    month_array = []
    days = total_days
    num_spaces_before.times { month_array << "   " }
    days +=1 if self.leap_year? and month == 'February' 
    days.times do |i|
      if i < 9
        month_array << " #{i + 1} "
      else
        month_array << "#{i + 1} "
      end
    end
    fill_in_remaining month_array
  end

  def fill_in_remaining(month_array) 
    filled_in_currently = total_days + num_spaces_before
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
    weeks = quartered_weeks
  end

  def to_s
    body = print_header
    body << "\n"
    month_array = self.build_month
    month_array.each_slice(7) do |x|
      body << "#{x.join}".rstrip
      body << "\n"
    end
    return body.chomp if self.leap_year?
    body
  end

end

