class Month
  attr_accessor :month

  def initialize (month, day, year)
    @month = month
    @day = day.to_i
    @year = year.to_i
    #@days = ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday']
    @months = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  end

  #puts "#{Month.new('January', 01, 2014).month}"

  def calc
    @idx = @months.each_index.select { |index| @months[index] == @month }
    if @idx[0] < 2
      @month = @idx[0] += 13
    else
      @month = @idx[0] += 1
    end
  
    if @month == 13 or @month == 14
      @year -= 1
    end

    h = (@day + ((@month +1) * 26) / 10) + @year + (@year / 4 ) + 6 * (@year / 100) + (@year/400)
    h = h % 7
  
  end

end

