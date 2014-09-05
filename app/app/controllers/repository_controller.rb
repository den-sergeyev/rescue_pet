class RepositoryController < ApplicationController

  def index
    # Get OAuth information from user
    response = request.env["omniauth.auth"]
    access_token = response[:credentials][:token]

    # Save users token in db (only one user is stored in db)
    user = User.first_or_initialize
    user.token = access_token
    user.save!
  end

end
