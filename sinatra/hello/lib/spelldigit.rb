class Spell_digit

def self.convert(num, s = "" )
   number = num.to_i
   return s if number == 0
    to_spell.keys.each do |divisor|
     quotient,modulus = number.divmod(divisor)
     s << to_spell[divisor] * quotient
    return self.convert(modulus,s) if quotient > 0
  end
end


 def self.to_spell
    hash= {
      10000 => "Ten Thousand",
      9000 => "Nine Thousand",
      8000 => "Eight Thousand",
      7000 => "Seven Thousand",
      6000 => "Six Thousand",
      5000 => "Five Thousand",
      4000 => "Four Thousand",
      3000 => "Three Thousand",
      2000 => "Two Thousand",
      1000 => "One Thousand",
      900 => "Nine hundred",
      800 => "Eight hundred",
      700 => "Seven hundred",
      600 => "Six hundred ",
      500 => "Five Hundred",
      400 => "Four Hundred",
      300 => "Three hundred",
      200 => "Two hundred",
      100 => "One hundred",
       90 => "Ninety",
       80 => "eighty",
       70 => "seventy",
       60 => "Sixty",
       50 => "fifty",
       40 => "forty",
       30 => "thirty",
       20 => "twenty",
       19 => "nineteen",
       18 => "eighteen",
       17 => "seventeen",
       16 => "sixteen",
       15 => "fifteen",
       14 => "fourteen",
       13 => "thirteen",
       12 => "twelve",
       11 => "eleven",
       10 => "ten",
        9 => "nine",
        8 => "eight",
        7 => "seven",
        6 => "six",
        5 => "five",
        4 => "four",
        3 => "three",
        2 => "two",
        1 => "one",
       
}
end

end 


