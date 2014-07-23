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

get '/drop_table' do
erb :drop_table
end

post '/drop_table' do
database = params[:database]
table = params[:table]
con4 = Mysql.new('localhost', 'root', '123456789',database)
con4.query("use #{database}")
con4.query("drop table #{table}")

redirect '/drop_table'
end


get '/drop_database' do
erb :drop_database
end

post '/drop_database' do
database = params[:database]
con5 = Mysql.new('localhost', 'root', '123456789',database)
con5.query("drop database #{database}")

redirect '/drop_database'
end


get '/create_database' do
erb :create_database
end

post '/create_database' do
database = params[:database]
con6 = Mysql.new('localhost', 'root', '123456789')
con6.query("create database #{database}")

redirect '/create_database'
end


get '/create_table' do
erb :create_table
end

post '/create_table' do
database = params[:database]
table = params[:table]
values = params[:values]
con7 = Mysql.new('localhost', 'root', '123456789',database)
con7.query("use #{database}")
con7.query("create table #{table}(#{values})")

redirect '/create_table'
end

