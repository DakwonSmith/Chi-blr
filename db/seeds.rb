# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/

# Run this script with `bundle exec ruby app.rb`

require 'active_record'

#require classes

require './models/user.rb'
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
    database: 'db/chiblr.db'
  )
end


CSV.foreach('CAR_DATA.csv') do |row|
  puts row.inspect
  if row[0] != "id"
    # extract customer Data
    first_name = row[1]
    last_name = row[2]
    gender = row[4]
    phone_number = row[5]
    email = row[3]
    # make customer record
    customer_instance = Customer.create(
      first_name: first_name,
      last_name: last_name,
      gender: gender,
      phone_number: phone_number,
      email: email
    )
    # extract car Data

    # make a car record
    car_instance = Car.create(
      make: row[6],
      model: row[7],
      year: row[8],
      sale_markup: row[9],
      cost_price: row[10]
    )
    # make a Transaction with both
    Sale.create(car: car_instance, customer: customer_instance)
  end
end
