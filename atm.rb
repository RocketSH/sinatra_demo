require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions
account = 0

get '/atm' do
  erb :atm
end

post '/atm' do
  amount = params[:amount].to_i
  if params[:option] == "plus"
    account = account + amount
  elsif params[:option] == "minus" && amount >= 0 && account > amount
    account -= amount
  else
    account = account
  end

  session[:account] = account
  redirect "/atm"
end