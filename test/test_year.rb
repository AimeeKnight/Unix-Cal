require 'test/unit'
require 'year'

class YearTest < MiniTest::Unit::TestCase
  
  def test_instaniate_year 
    year_instance = Year.new(2014)
    assert_equal year_instance.year, 2014
  end

  def test_create_months
    year_instance = Year.new(2014)
    year_instance.create_months
    assert_equal year_instance.months.length, 12
  end

  def test_print_months
    year_instance = Year.new(2014)
    year_instance.create_months
    year_instance.print_header
    year_instance.quarter_months
    year_instance.print_quarters
    assert_equal year_instance.months.length, 12
  end

end

