require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require 'haml'
require "./environments"



class Pet < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

class Event < ActiveRecord::Base
end


get "/" do
  haml :index
end

get "/pets" do
  @pets = Pet.all
  haml :'pet/index'
end


get "/pets/new" do
  @pet = Pet.new
  haml :'pet/new'
end

get "/pets/:id" do
  @pet = Pet.find(params[:id])
  haml :'pet/profile'
end

post "/pets" do
  @pet = Pet.create(params[:pet])
  if @pet.save
    redirect :"/pets/#{@pet.id}"
   else
     haml :"pet/new"
  end
end


