require_relative 'zeller_calculator'

class Year
  attr_accessor :year, :months, :quartered_months
  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

  def initialize year
    self.year = year
    self.months = []
    self.quartered_months = []
  end

  def create_months
    MONTHS.each_with_index do |month, i|
      month = Month.new(MONTHS[i], year)
      months << month
    end
  end

  def print_months
    self.months.each do |month|
      puts month.to_s
    end
  end

  def print_header
    i = 0
    puts
    puts "#{year}".center(60)
    puts "      #{MONTHS[i]}               #{MONTHS[i+1]}               #{MONTHS[i+2]}        "
    puts "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    puts
  end

  def quarter_months
    months.each_slice(3) do |three_months|
      quartered_months << three_months
    end
  end

  def print_quarters
    j = 0
    i = 0
    while j < 4
      week_string = ""
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i].join
        week_string << " "
      end
      week_string << "\n"
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i+1].join
        week_string << " "
      end
      week_string << "\n"
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i+2].join
        week_string << " "
      end
      week_string << "\n"
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i+3].join
        week_string << " "
      end
      week_string << "\n"
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i+4].join
        week_string << " "
      end
      week_string << "\n"
      quartered_months[j].each_with_index do |month, index|
        week_string << month.weeks[i+5].join
        week_string << " "
      end
      puts "#{week_string}"
      j += 1
    end
  end

end
