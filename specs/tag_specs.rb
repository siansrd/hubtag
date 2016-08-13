require('minitest/autorun')
require('minitest/rg')
require_relative('../src/tag')

class TestTag < Minitest::Test

  def setup
    @tag1 = Tag.new("Hubtag!")
    @tag2 = Tag.new("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")  # too long
  end

  def test_tag_text()
    assert_equal("Hubtag!", @tag1.tag_text)
  end

  def test_tag()
    assert_equal(['H','u','b','t','a','g','!'], @tag1.tag) 
  end
  
  def test_height()
    assert_equal(Tag::MAX_HEIGHT, @tag1.height)
  end 
  
  def test_width()
    assert_equal(7, @tag1.width) # TODO: should be sum of lengths of all letters
  end
  
  def test_too_long()
    assert_equal(false, @tag1.too_long)
    assert_equal(true,  @tag2.too_long)
  end
  
end
