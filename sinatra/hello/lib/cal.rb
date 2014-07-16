require 'sinatra'
require './roman'
require './numbers'
require './spelldigit' 
require './day'

get '/page' do
month = params['month'].to_i
day = params['date'].to_i
year = params['year'].to_i
page = File.read('./form1.html')
s = Roman.convert(year)
d = Numbers.convert(day)
spell = Spell_digit.convert(year)
x = ""
if month!=0 && day!=0 && year!=0
t = Time.new(year,month,day)
x = t.strftime('%A')
a = Day.convert(x)
end
page = page + d.to_s + "\s" + month.to_s + "\s" + year.to_s + "\s" + s + "\s" + spell + "\s" 
page = page + x + "\n" + a.to_s

end
