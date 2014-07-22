require 'sinatra'
require 'mysql'


con = Mysql.new('localhost', 'root', '123456789')  
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

# root page
get '/' do
  @time =  Time.now.strftime("%d/%m/%y %A")
  erb :index
end  

get '/data' do 
res = []
@rs = con.query("show databases")
erb :data
end

get '/show_data' do
database = params[:database]
con2 = Mysql.new('localhost', 'root', '123456789', database) 
@rs2  = con2.query("show tables")

erb :show_data
end


get '/show_table' do
database = params[:database]
table = params[:table]
con3 = Mysql.new('localhost', 'root', '123456789', database) 
@rs3 = con3.query("describe #{table}")
@rs4 = con3.query("select * from #{table}")


erb :show_table
end
