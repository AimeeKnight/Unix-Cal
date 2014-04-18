class Month
  attr_accessor :month

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
    @num_spaces_before = @spaces_before[@start]
    @num_spaces_after = @spaces_after[@start]
  end

  def cal
    @idx = @months.each_index.select { |index| @months[index] == @month }
    if @idx[0] < 2
      @month_int = @idx[0] += 13
    else
      @month_int = @idx[0] += 1
    end
  
    if @month_int == 13 or @month_int == 14
      @year -= 1
    end

    h = (@day + ((@month_int +1) * 26) / 10) + @year + (@year / 4 ) + 6 * (@year / 100) + (@year/400)
    @start = h % 7
  end
  
  def print_month
    puts month
    puts 'Su Mo Tu We Th Fr Sa'
    @num_spaces_before.times { print "   " }
    print " 1 "
    num = 2
    @num_spaces_after.times do
      print " #{num} " 
      num += 1
    end

    next_line = 7
    (@total_days - num + 1).times do
      puts if next_line % 7 == 0
      if num < 10
        print " #{num} " 
      else
        print "#{num} " 
      end
      num += 1
      next_line += 1
    end
    puts
  end

end

