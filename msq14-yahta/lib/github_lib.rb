module GithubLib
  extend self


  # Example:
  #    GithubLib.clone("/tmp/my_repo", "apotonick/hooks", "qwerwe")
  #
  def clone(dir, full_name, token)
    GitLib.git('clone', name_to_https(full_name, token), dir)
    # The previous code is unsafe: it leaves token on disk.
    # The fix sould be following, however it does not work.
    #cmd(dir, 'init')
    #cmd(dir, 'pull', name_to_url(full_name, token))
  end

  def name_to_https(full_name, token)
    "https://#{token}@github.com/#{full_name}.git"
  end
end
