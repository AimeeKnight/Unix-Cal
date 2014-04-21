require 'test/unit'
require 'year'

#class YearTest < MiniTest::Unit::TestCase
class YearTest < Test::Unit::TestCase
  
  def test_instaniate_year 
    year_instance = Year.new(2014)
    assert_equal year_instance.year, 2014
  end

  def test_create_months
    year_instance = Year.new(2014)
    year_instance.create_months
    assert_equal year_instance.months.length, 12
  end

  def test_2014_to_string
    expected = `cal 2014`
    actual = `ruby ./lib/cal 2014`
    assert_equal expected, actual
  end

  #def test_print_months
  #  year_instance = Year.new(2012)
  #  year_instance.create_months
  #  year_instance.quarter_months
  #  year_instance.to_s
  #  assert_equal true, true
  #end

end

