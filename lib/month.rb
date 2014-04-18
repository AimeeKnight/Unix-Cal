class Month
  include Enumerable
  attr_accessor :month
  attr_reader :start

  def initialize (month, day, year)
    @month = month
    @day = day.to_i
    @year = year.to_i
    @months = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @month_lengths = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
    @spaces_before = [6, 0, 1, 2, 3, 5, 5]
    @spaces_after =  [0, 6, 5, 4, 3, 2, 1]
    @total_days = @month_lengths[@month]
    @start = self.cal
    @num_spaces_before = @spaces_before[@start - 1]
    @num_spaces_after = @spaces_after[@start - 1]
    @month_array = self.build_month
    @month_int
  end

  def leap_year?
    (@year % 4 == 0) and !(@year % 100 == 0) || (@year % 400 == 0)
  end

  def prep_zeller_month
    @idx = @months.each_index.select { |index| @months[index] == @month }
    if @idx[0] < 2
      @month_int = @idx[0] += 13
    else
      @month_int = @idx[0] += 1
    end
  end

  def prep_zeller_year
    if @month_int == 13 or @month_int == 14
      @year -= 1
    else
      @year
    end
  end

  def cal
    self.prep_zeller_year
    self.prep_zeller_month
    puts
    puts "YEAR #{@year}"
    h = (@day + ((@month_int +1) * 26) / 10) + @year + (@year / 4 ) + 6 * (@year / 100) + (@year/400)
    h = h % 7
    @start = h
  end

  def build_month
    @total_days += 1 if self.leap_year? and @month == 'February' 
    month_array = []
    puts "#{month}".center(20)
    puts 'Su Mo Tu We Th Fr Sa'
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

  def display
    @month_array = @month_array.each_slice(7) do |x|
      puts "#{x.join}"
    end
  end

end

