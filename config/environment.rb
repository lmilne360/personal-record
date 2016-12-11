require 'bundler/setup'
Bundler.require

require 'require_all'
require_all 'app'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
