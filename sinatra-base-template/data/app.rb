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
#This is to redirect
get '/other_db' do
erb :other_db
end
#This is to show the list of databases
get '/data' do 
res = []
@rs = con.query("show databases")
erb :data
end
#This is to show the list of tables
get '/show_data' do
database = params[:database]
con2 = Mysql.new('localhost', 'root', '123456789', database) 
@rs2  = con2.query("show tables")

erb :show_data
end
#This is to show the table description
get '/show_table' do
database = params[:database]
table = params[:table]
con3 = Mysql.new('localhost', 'root', '123456789', database) 
@rs3 = con3.query("describe #{table}")
@rs4 = con3.query("select * from #{table}")

erb :show_table
end
#It is the get method
get '/drop_table' do
erb :drop_table
end
#It is to delete table
post '/drop_table' do
database = params[:database]
table = params[:table]
con4 = Mysql.new('localhost', 'root', '123456789',database)
con4.query("use #{database}")
con4.query("drop table #{table}")

redirect '/drop_table'
end
#It is a get method for database
get '/drop_database' do
erb :drop_database
end
#This is to delete database
post '/drop_database' do
database = params[:database]
con5 = Mysql.new('localhost', 'root', '123456789',database)
con5.query("drop database #{database}")

redirect '/drop_database'
end
#This is to create database
get '/create_database' do
erb :create_database
end

post '/create_database' do
database = params[:database]
con6 = Mysql.new('localhost', 'root', '123456789')
con6.query("create database #{database}")

redirect '/create_database'
end
#This is to create table
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
#This is to insert the values in the table
get '/insert_query' do
erb :insert_query
end

post '/insert_query' do
database = params[:database]
table = params[:table]
values = params[:values]
attributes = params[:attributes]
con8 = Mysql.new('localhost', 'root', '123456789',database)
con8.query("use #{database}")
con8.query("insert into #{table}(#{values})values(#{attributes})")

redirect '/insert_query'
end
#This is to add more columns to table
get '/add_col' do
erb :add_col
end

post '/add_col' do
database = params[:database]
table = params[:table]
values = params[:values]
col = params[:col]
con9 = Mysql.new('localhost', 'root', '123456789',database)
con9.query("use #{database}")
con9.query("alter table #{table} add column #{col} #{values}")

redirect '/add_col'
end
