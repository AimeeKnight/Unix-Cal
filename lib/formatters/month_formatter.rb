module Formatters
class MonthFormatter
  attr_accessor :month

  WEEK_ROW_FORMAT       = '%2s' + '%3s' * 6
  WEEKDAY_HEADER_FORMAT = '%2s' + '%3s' * 6

  def initialize(month)
    self.month = month
  end

  def header
    "#{month.name} #{month.year}".center(20).rstrip
  end

  def days_of_the_week
    WEEKDAY_HEADER_FORMAT % Month::WEEKDAY_ABBREVIATIONS
  end

  def to_a
    output = []
    output << days_of_the_week

    month.to_a.each do |week|
      output << WEEK_ROW_FORMAT % week
    end

    output
  end

  def to_s
    output = []
    output << header
    output += to_a

    output.join("\n")
  end
end
end
