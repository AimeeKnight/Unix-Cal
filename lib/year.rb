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

  def to_s
    self.create_months
    self.quarter_months
    i = 0
    row = ""
    4.times do |group_of_three_months|
      row << print_subhead(i)
      6.times do |week_row|
        row << "\n"
        quartered_months[group_of_three_months].each_with_index do |month, index|
          row << "  " if index != 0 
          if index == 2 && week_row == 4 && month.weeks[5].first == "   "
            row << month.weeks[week_row].join.rstrip
          elsif index == 2 and week_row == 5
            row << month.weeks[week_row].join.rstrip
          else
            row << month.weeks[week_row].join.chop 
          end
        end
        week_row += 1
      end
      # reset week_row to zero since we need to move to the next group of three months and print the first week
      week_row = 0
      group_of_three_months += 1
      i += 3
    end
    row.prepend print_year_header
    row << "\n"
    "#{row}"
  end

end
