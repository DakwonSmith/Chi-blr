require 'sinatra'

get '/' do
	erb :index
end

get '/log_in' do
	erb :login
end

get '/sign_up' do
	erb :signup
end

get '/dashboard' do
	erb :userdash
end


