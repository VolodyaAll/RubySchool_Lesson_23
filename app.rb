#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
@user = []

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do
  f = File.open("./public/users.txt", "a")
  f.write("Name: #{params[:username]}, Phone: #{params[:phone]}, Date/time: #{params[:date_time]}, Barber: #{params[:barber]}.\n")
  f.close
  "Dear #{params[:username]}, we will be waiting for you at #{params[:date_time]}. Your barber is #{params[:barber]}. See you! <a href=\"http://localhost:4567\">На главную</a>"
end

post '/contacts' do
  f = File.open("./public/contacts.txt", "a")
  f.write("Email: #{params[:email]}, Message: #{params[:message]}.\n")
  f.close
  "We will send our answer to #{params[:email]}. See you! <a href=\"http://localhost:4567\">На главную</a>"
end