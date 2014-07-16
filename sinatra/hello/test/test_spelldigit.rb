require_relative '../lib/spelldigit'
require 'test/unit'


class TestSpell_digit < Test::Unit::TestCase

  def test_hello
    assert true
  end


  def test_one
   assert_equal "twentynine",Spell_digit.convert(29)
   assert_equal "twenty",Spell_digit.convert(20)
    assert_equal "three",Spell_digit.convert(3)
   assert_equal "fifteen",Spell_digit.convert(15)
  assert_equal "One ThousandThree hundredthirtysix",Spell_digit.convert(1336)
   assert_equal "Seven hundred",Spell_digit.convert(700)
   assert_equal "Two Thousand",Spell_digit.convert(2000)
   assert_equal "Nine ThousandNine hundredNinetynine",Spell_digit.convert(9999)
   assert_equal "",Spell_digit.convert(0)
   assert_equal "Ten ThousandNine hundredNinetynine",Spell_digit.convert(10999)
  end
end
