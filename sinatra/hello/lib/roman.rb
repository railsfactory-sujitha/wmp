class Roman

  def self.to_roman
   
      {
      1000 => "M",
      500 => "D",
      100 => "C",
      50 => "L",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
 end
def self.convert(num, result = "")
   number = num.to_i
   return result if number == 0
  to_roman.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << to_roman[divisor] * quotient
    return self.convert(modulus, result) if quotient > 0
  end
 end 
end  

