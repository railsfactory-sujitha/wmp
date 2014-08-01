require_relative '../lib/numbers'
require 'test/unit'


class TestNumbers < Test::Unit::TestCase



  def test_num
    assert_equal '1st',Numbers.convert(1)
    assert_equal '2nd',Numbers.convert(2)
    assert_equal '6th',Numbers.convert(6)
    assert_equal '16th',Numbers.convert(16)
     assert_equal '18th',Numbers.convert(18)
    assert_equal '22nd',Numbers.convert(22)
    assert_equal '26th',Numbers.convert(26)
    assert_equal '31st',Numbers.convert(31)
     assert_equal '',Numbers.convert(40)
  end



end 
