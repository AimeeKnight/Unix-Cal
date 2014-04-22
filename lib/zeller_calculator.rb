class ZellerCalculator
  MONTHS = ['January','February','March','April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  attr_accessor :original_month,
                :original_year,
                :original_day

  def initialize(month, year, day = 1)
    self.original_year = year
    self.original_day = day
    self.original_month = month
  end

  def original_month=(month)
    if month.class == String
      @original_month = MONTHS.each_index.find { |index| MONTHS[index] == month }
    else
      @original_month - 1
    end
  end

  def calculate
    calculated_day = original_day
    calculated_month = ((zeller_month + 1) * 26) / 10
    calculated_year = zeller_year + (zeller_year / 4) + 6 * (zeller_year / 100) + (zeller_year / 400)

    (calculated_day + calculated_month + calculated_year) % 7
  end

  private

  def zeller_year
    if zeller_month == 13 || zeller_month == 14
      original_year - 1
    else
      original_year
    end
  end

  def zeller_month
    if original_month < 2
      original_month + 13
    else
      original_month + 1
    end
  end

end
