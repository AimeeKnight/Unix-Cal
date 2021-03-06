require 'test/unit'
require 'year'

class YearTest < MiniTest::Unit::TestCase
#class YearTest < Test::Unit::TestCase
  
  def test_instaniate_year 
    year_instance = Year.new(2014)
    assert_equal year_instance.year, 2014
  end

  def test_create_months
    year_instance = Year.new(2014)
    year_instance.create_months
    assert_equal year_instance.months.length, 12
  end

 def test_quarter_months
   year_instance = Year.new(2012)
   year_instance.create_months
   year_instance.quarter_months
   assert_equal year_instance.quartered_months.length, 4
 end

  def test_2012_to_string
    expected = `cal 2012`
    actual = `ruby ./lib/cal 2012`
    assert_equal expected, actual
  end

  def test_2014_to_string
    expected = `cal 2014`
    actual = `ruby ./lib/cal 2014`
    assert_equal expected, actual
  end

  def test_2015_to_string
    expected = `cal 2015`
    actual = `ruby ./lib/cal 2015`
    assert_equal expected, actual
  end

  def test_2000_to_string
    expected = `cal 2000`
    actual = `ruby ./lib/cal 2000`
    assert_equal expected, actual
  end

  def test_2100_to_string
    expected = `cal 2100`
    actual = `ruby ./lib/cal 2100`
    assert_equal expected, actual
  end

  def test_1800_to_string
    expected = `cal 1800`
    actual = `ruby ./lib/cal 1800`
    assert_equal expected, actual
  end
 
  #def test_loop
  #  i = 1800
  #  while i < 3000
  #    expected = `cal "#{i}"`
  #    actual = `ruby ./lib/cal "#{i}"`
  #    assert_equal expected, actual
  #  i += 1
  #  end
  #end

end

