class User < ActiveRecord::Base

  def octokit_client
    client = Octokit::Client.new(:access_token => User.first.token)
  end

end
