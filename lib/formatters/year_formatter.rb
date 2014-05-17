module Formatters
class  YearFormatter
  attr_accessor :year

  YEAR_ROW_FORMAT = '%s  %s  %s'

  def initialize(year)
    self.year = year
  end

  def header
    year.to_s.center(62).rstrip
  end

  def months
    year.months.map do |month|
      [month.name.center(20)] + MonthFormatter.new(month).to_a
    end
  end

  def to_s
    output = []
    output << header
    output << ""

    each_quarter do |quarter|
      quarter.each do |row|
        output << YEAR_ROW_FORMAT % row
      end
    end

    output.join("\n")
  end

  def each_quarter
    months.each_slice(3) do |quarter|
      yield quarter.transpose
    end
  end
end
end
