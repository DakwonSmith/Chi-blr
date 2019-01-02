require 'sinatra'
require "sinatra/reloader"

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require classes
require './models/user.rb'
require './models/email.rb'
require './models/post.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
if ENV['DATABASE_URL']
	require 'pg'
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])  
else
	require 'sqlite3'
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/development.db'
  )
end


register Sinatra::Reloader
enable :sessions

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


