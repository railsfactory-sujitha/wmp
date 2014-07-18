require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './todolist'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end
t = Todolist.new("todo.txt")
enable :sessions
set :session_secret, 'randomesecretkey112324'


# root page
get '/' do
  @time =  Time.now
  erb :index
end  



get '/erb_example' do
 erb :example
end  

get '/add1' do
erb :add1
end
post '/add1' do
item = params[:item]
t.add(item)
t.save
 
erb :add1
end

get '/list' do
@li = []
@li = t.list
erb :list
end

get '/pending' do
@str = []
@str = t.pending
erb :pending
end
get '/complete' do
@str1 = []
@str1 = t.completed
erb :complete
end
get '/login' do
erb :login
end

get '/delete' do
num = params[:items].to_i
t.delete(num)
t.save
erb :delete
end

get '/completed' do
erb :completed
end

post '/completed' do
num = params[:items].to_i
t.complete(num)
t.save
erb :completed
end

get '/modify' do
erb :modify
end

post '/modify' do
num = params[:items].to_i
item = params[:item]
t.modify(num,item)
t.save
erb :modify
end
post '/login' do
  session[:username]= params[:username]
  # erb :login
  redirect "/member"
end


get '/logout' do
  session.clear
  @message= "you have been logged out"
  erb :logout
end  


get "/member" do
  if session[:username]
    erb :member
  else
  redirect "/login"
end


end
