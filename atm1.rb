require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions

get '/atm' do
  erb :atm1
end

post '/atm' do
  account = session[:account] || 0
  amount = params[:amount].to_i

  if params[:transaction] == "plus" && amount >= 0
    account += amount
  elsif params[:transaction] == "minus" && amount >= 0 && account > amount
    account -= amount
  end
  session[:account] = account
  redirect "/atm"
end