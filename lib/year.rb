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

  def print_year_header
    header = ""
    header << "#{year}".center(62).rstrip
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

  def long_month? index

  end

  def to_s
    self.create_months
    self.quarter_months
    i, j, k = 0, 0, 0
    row = ""
    # j represents a set of three months (four total)
    while j < 4
      row << print_subhead(k)
      # i represents a row of weeks (six total)
      while i < 6
        row << "\n"
        quartered_months[j].each_with_index do |month, index|
          row << "  " if index != 0 
          if index == 2 && i == 4 && month.weeks[5].first == "   "
            row << month.weeks[i].join.rstrip
          elsif index == 2 and i == 5
            row << month.weeks[i].join.rstrip
          else
            row << month.weeks[i].join.chop 
          end
        end
        i += 1
      end
      # reset i to zero since we need to start the next set of months and print the first week
      i = 0
      j += 1
      k += 3
    end
    row.prepend print_year_header
    row << "\n"
    "#{row}"
  end

end
