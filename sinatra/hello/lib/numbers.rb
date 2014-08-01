class Numbers

  def self.convert(n)

if (1..31) === n
case n
when 1,21,31
s = "#{n}"+'st'
when 2,22
s = "#{n}"+'nd'
when 3,23
s = "#{n}"+'rd'
else
s = "#{n}"+'th'
end
else n > 31
  s= ''
end
end
end 
