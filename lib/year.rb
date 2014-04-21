class Year
  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  attr_accessor :year,
                :months,
                :quartered_months

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

  def print_year_header
    header = ""
    header << "#{year}".center(60).rstrip
    header << "\n"
  end

  def print_subhead i
    subhead = ""
    subhead << "\n"
    subhead << "#{MONTHS[i]}".center(20)
    subhead << "  "
    subhead << "#{MONTHS[i + 1]}".center(20)
    subhead << "  "
    subhead << "#{MONTHS[i + 2]}".center(20).rstrip
    subhead << "\n"
    subhead << "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
  end

  def quarter_months
    months.each_slice(3) do |three_months|
      quartered_months << three_months
    end
  end

  def to_s
    self.create_months
    self.quarter_months
    i, j, k = 0, 0, 0
    week_string = ""
    while j < 4
      week_string << print_subhead(k)
      while i < 6
        week_string << "\n"
        quartered_months[j].each_with_index do |month, index|
          week_string << month.weeks[i].join
          week_string << " "
        end
        i += 1
      end
      i = 0
      j += 1
      k += 3
    end
    week_string.prepend print_year_header
    "#{week_string}"
  end

end
