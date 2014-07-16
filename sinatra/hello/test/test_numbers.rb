require_relative '../lib/numbers'
require 'test/unit'


class TestNumbers < Test::Unit::TestCase



  def test_num
    assert_equal 'first',Numbers.convert(1)
    assert_equal 'second',Numbers.convert(2)
    assert_equal 'sixth',Numbers.convert(6)
    assert_equal 'thirtyfirst',Numbers.convert(31)
     assert_equal '',Numbers.convert(40)
  end



end 
