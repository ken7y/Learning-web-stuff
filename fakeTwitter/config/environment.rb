require 'sqlite3'
# require_relative '../lib/student'

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


require_all 'app'
DB = {:conn => SQLite3::Database.new("db/logins.db")}

DB = {:conn => SQLite3::Database.new("db/tweets.db")}
