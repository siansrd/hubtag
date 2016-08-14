require('minitest/autorun')
require('minitest/rg')
require_relative('../src/letter')
require_relative('../src/pair')

class TestTag < Minitest::Test

  def setup()
    @letter1 = Letter.new('a')
  end
  
  
  def test_char()
    assert_equal('A', @letter1.char())
  end
  
  
  def test_height()
    assert_equal(7, @letter1.height())
  end
  
  
  def test_width()
    assert_equal(4, @letter1.width())
  end
  
  
  def test_bitmap()
    assert_equal(Letter::LETTERS['A'], @letter1.bitmap())
  end
  
end
