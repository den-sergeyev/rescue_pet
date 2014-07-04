# CREATE USER postgres WITH NOSUPERUSER CREATEDB NOCREATEROLE;
# CREATE DATABASE rescue_pet_development WITH OWNER postgres;
configure :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/rescue_pet_developement')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end
