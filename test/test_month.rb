require 'month'
require 'test/unit'

class MonthTest < MiniTest::Unit::TestCase

  def test_01_01_2014
    month = Month.new('January', 01, 2014)
    assert_equal 4, month.cal
    #Wednesday
  end

  def test_02_28_2014
    month = Month.new('February', 28, 2014)
    assert_equal 6, month.cal
    #Friday
  end

  def test_02_01_2014
    month = Month.new('February', 01, 2014)
    assert_equal 0, month.cal
    #Saturday
  end

  def test_03_01_2014
    month = Month.new('March', 01, 2014)
    assert_equal 0, month.cal
    #Saturday
  end

  def test_04_01_2014
    month = Month.new('April', 01, 2014)
    assert_equal 3, month.cal
    #Tuesday 
  end

  def test_02_29_2014
    month = Month.new('February', 29, 2016)
    assert_equal 2, month.cal
    #Monday 
  end

  #def test_invalid_entry
   # asert_raises ArgumentError do
      #Month.cal(022012)
    #end
  #end

end
