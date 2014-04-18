require 'month'
require 'test/unit'

class MonthTest < MiniTest::Unit::TestCase

  def test_true_is_true
    assert_equal true, true
  end

  def test_01_01_2014
    month = Month.new('January', 01, 2014)
    assert_equal 4, month.calc
  end

  def test_02_28_2014
    month = Month.new('February', 28, 2014)
    assert_equal 6, month.calc
  end

  def test_03_01_2014
    month = Month.new('March', 01, 2014)
    assert_equal 0, month.calc
  end

  def test_04_01_2014
    month = Month.new('April', 01, 2014)
    assert_equal 3, month.calc
  end

  #def test_invalid_entry
   # asert_raises ArgumentError do
      #Month.calc(022012)
    #end
  #end

end
