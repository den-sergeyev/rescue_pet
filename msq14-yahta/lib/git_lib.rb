module GitLib
  extend self

  delegate :cmd, :to => ProcessLib

  def git(*args)
    cmd 'git', *args
  end

  # Example:
  #  GitLib.git_dir("/tmp/my_repo", 'log')
  #
  def git_dir(*args)
    git '--git-dir', File.join(dir, '.git'), *args
  end
end
