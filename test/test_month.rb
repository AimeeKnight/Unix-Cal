require 'month'
require 'test/unit'

class ZellerCalculatorTest < Test::Unit::TestCase

  def test_weeks
    month = Month.new('January', 2014, 01)
    assert_equal true, true
  end

  def test_01_01_2014
    zeller = ZellerCalculator.new('January', 2014, 01)
    assert_equal 4, zeller.calculate
    #Wednesday
  end

  def test_02_28_2014
    zeller = ZellerCalculator.new('February', 2014, 28)
    assert_equal 6, zeller.calculate
    #Friday
  end

  def test_02_01_2014
    zeller = ZellerCalculator.new('February', 2014, 01)
    assert_equal 0, zeller.calculate
    #Saturday
  end

  def test_03_01_2014
    zeller = ZellerCalculator.new('March', 2014, 01)
    assert_equal 0, zeller.calculate
    #Saturday
  end

  def test_04_01_2014
    zeller = ZellerCalculator.new('April', 2014, 01)
    assert_equal 3, zeller.calculate
    #Tuesday
  end

  def test_02_29_2016
    zeller = ZellerCalculator.new('February', 2016, 29)
    assert_equal 2, zeller.calculate
    #Monday
  end

end

#class MonthTest < MiniTest::Unit::TestCase
class MonthTest < Test::Unit::TestCase

  def test_01_01_2014_to_string
    expected = `cal January 2014`
    actual = `ruby ./lib/cal January 2014`
    assert_equal expected, actual
  end

  def test_01_01_2014_to_string
    expected = `cal 1 2014`
    actual = `ruby ./lib/cal 1 2014`
    assert_equal expected, actual
  end

  def test_02_28_2014_to_string
    expected = `cal Februay 2014`
    actual = `ruby ./lib/cal February 2014`
    assert_equal expected, actual
  end

  def test_02_01_2012_to_string
    expected = `cal Februay 2012`
    actual = `ruby ./lib/cal February 2012`
    assert_equal expected, actual
  end

  def test_03_01_2014_to_string
    expected = `cal March 2014`
    actual = `ruby ./lib/cal March 2014`
    assert_equal expected, actual
  end

  def test_08_01_2014_to_string
    expected = `cal August 2014`
    actual = `ruby ./lib/cal August 2014`
    assert_equal expected, actual
  end

  def test_invalid_entry
    assert_raises ArgumentError do
      Month.new(2200)
    end
  end

end
