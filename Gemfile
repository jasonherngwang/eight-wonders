source "https://rubygems.org"

ruby "3.1.2"

gem "sinatra"
gem "sinatra-contrib"
gem "erubis"
gem "rake", require: false
gem "rubocop", "0.86.0", require: false
gem "dotenv"
gem "nanoid"
gem "pg"
gem "pry"

group :production do
  gem "puma"
end

group :test do
  gem "minitest"
  gem "minitest-reporters"
  gem "rack-test"
  gem "simplecov"
end