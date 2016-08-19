require('minitest/autorun')
require('minitest/rg')
require_relative('../src/pair')

class TestTag < Minitest::Test


  def setup()
     @pair1 = Pair.new(1,2)
  end
  
  def test_first() 
    assert_equal(1, @pair1.first())
  end
  
  def test_second()
    assert_equal(2, @pair1.second())
  end
  
  def test_to_s()
    assert_equal("(1,2)", @pair1.to_s())
  end
  
  def test_to_a()
    assert_equal([1,2], @pair1.to_a())
  end
  
end
