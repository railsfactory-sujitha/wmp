require 'sinatra'
require './roman'
require './numbers'
require './spelldigit'
get '/page' do
month = params['month']
day = params['date']
year = params['year']
page = File.read('./form1.html')
s = Roman.convert(year)
d = Numbers.convert(day)
spell = Spell_digit.convert(year)
page = page + month.to_s + "\s" + d.to_s + "\s" + year.to_s + "\s" + s + "\s" + spell
end
