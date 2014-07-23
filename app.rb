require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require "sinatra/reloader" if development?
require 'haml'
require "./environments"
require "sinatra/json"
set database_file: "database.yml"

enable :sessions

require './models'

get "/pets" do
  @pets = Pet.all
  json pets: @pets.map(&:to_json)
end

get "/pets/:id" do
  @pet = Pet.find(params[:id])
  json pet: @pet.to_json
end

post "/pets" do
  @pet = Pet.create(params[:pet])
  if @pet.save
    json status: :created, pet: @pet.to_json
  else
    json status: :error, errors: @pet.errors.to_json
  end
end

put "/pets/:id" do
  @pet = Pet.find(params[:id])
  if @pet.update(params[:pet])
    json status: :updated, pet: @pet.to_json
  else
    json status: :error, errors: @pet.errors.to_json
  end
end

#=======================================================
#TODO should be deleted, is kept for debug purposes only
get "/pets/new" do
  @pet = Pet.new
  haml :'pet/new'
end

get "/pets/:id/edit" do
  @pet = Pet.find(params[:id])
  haml :"pet/update"
end
#=======================================================

module Sinatra
  module Flash
    module Style
      def styled_flash(key=:flash)
        return "" if flash(key).empty?
        id = (key == :flash ? "flash" : "flash_#{key}")
        close = '<a class="close" data-dismiss="alert" href="#">×</a>'
        messages = flash(key).collect {|message| "  <div class='alert alert-#{message[0]}'>#{close}\n #{message[1]}</div>\n"}
        "<div id='#{id}'>\n" + messages.join + "</div>"
      end
    end
  end
end
