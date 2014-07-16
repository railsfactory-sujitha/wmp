require_relative '../lib/roman'
require 'test/unit'


class TestRoman < Test::Unit::TestCase

  def test_hello
    assert true
  end


  def test_one
    assert_equal "I",Roman.convert(1)
    assert_equal "L",Roman.convert(50)
    assert_equal "X",Roman.convert(10)
    assert_equal 'IV',Roman.convert(4)
    assert_equal "XI",Roman.convert(11)
    assert_equal "",Roman.convert(0)
    assert_equal "MMMM",Roman.convert(4000)
    assert_equal "MMMMX",Roman.convert(4010)
    assert_equal "CCCLXXXXVII",Roman.convert(397)
  end



end  
