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

  def print_year
    year_string = "#{year}".center(60)
  end

  def print_header i
    header = ""
    header << "\n"
    header << "#{MONTHS[i]}".center(20)
    header << " "
    header << "#{MONTHS[i + 1]}".center(20)
    header << " "
    header << "#{MONTHS[i + 2]}".center(20)
    header << "\n"
    header << "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
  end

  def quarter_months
    months.each_slice(3) do |three_months|
      quartered_months << three_months
    end
  end

  ### SHAMEFUL!!!
  def print_quarters
    i = 0
    j = 0
    k = 0
    week_string = ""
    while j < 4
      week_string << "\n"
      week_string << print_header(k)
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
      j += 1
      k += 3
    end
    week_string.prepend "\n"
    week_string.prepend print_year
    week_string.prepend "\n"
    puts "#{week_string}"
  end

end
