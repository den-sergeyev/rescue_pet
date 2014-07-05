require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require "sinatra/reloader" if development?
require 'haml'
require "./environments"

enable :sessions

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
    redirect :"/pets/#{@pet.id}", :notice => "Pet was created successfully!"
   else
     haml :"pet/new", :error => "Something went wrong :("
  end
end

get "/pets/:id/edit" do
  @pet = Pet.find(params[:id])
  haml :"pet/update"
end

put "/pets/:id" do
  @pet = Pet.find(params[:id])
  @pet.update(params[:pet])
  redirect :"/pets/#{@pet.id}"
end
