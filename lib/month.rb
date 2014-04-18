class Month
  include Enumerable

  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  MONTH_LENGTHS = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
  SPACES_BEFORE = [6, 0, 1, 2, 3, 5, 5]
  SPACES_AFTER  = [0, 6, 5, 4, 3, 2, 1]

  attr_accessor :month
  attr_reader :start

  def initialize (month, day, year)
    @month = month
    @day = day.to_i
    @year = year.to_i
    @start = self.zeller
    @total_days = MONTH_LENGTHS[@month]
    @num_spaces_before = SPACES_BEFORE[@start]
    @month_array = self.build_month
    @month_int
  end

  def leap_year?
    # increment year back to actual year since we set it back for zellers
    year = @year + 1
    (year % 4 == 0) and !(year % 100 == 0) || (year % 400 == 0)
  end

  def prep_zeller_month
    @idx = MONTHS.each_index.select { |index| MONTHS[index] == @month }
    if @idx[0] < 2
      @month_int = @idx[0] += 13
    else
      @month_int = @idx[0] += 1
    end
  end

  def prep_zeller_year
    @year -= 1 if @month_int == 13 or @month_int == 14
  end

  def zeller
    self.prep_zeller_month
    self.prep_zeller_year
    h = (@day + ((@month_int +1) * 26) / 10) + @year + (@year / 4 ) + 6 * (@year / 100) + (@year/400)
    h = h % 7
    @start = h
  end

  def build_month
    newline_counter = 0
    year = @year
    year = @year + 1 if @month == 'February' or @month == 'January'
    @total_days += 1 if self.leap_year? and @month == 'February' 
    month_array = []
    header = "#{month} #{year}".center(20).rstrip
    days = 'Su Mo Tu We Th Fr Sa'

    puts "#{header}"
    puts "#{days}"
    @num_spaces_before.times do
      month_array << "   "
    end

    @total_days.times do |i|
      if i < 9
        month_array << " #{i + 1} "
      else
        month_array << "#{i + 1} "
      end
    end
    @month_array = month_array
  end

  def to_s
    @month_array = @month_array.each_slice(7) do |x|
      puts "#{x.join}".rstrip
    end
      puts
  end

end

