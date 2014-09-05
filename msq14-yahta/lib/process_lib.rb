require 'open3'

module ProcessLib
  extend self

  class CommandError < IOError
  end

  # Example:
  #   ProcessLib.cmd('echo', "1")
  #
  def cmd(dir, *args)
    Open3.popen3 'git', '--git-dir', File.join(dir, '.git'), *args do |i, o, e, wait_thr|
      value = wait_thr.value
      unless value.success?
        error = e.read
        raise CommandError.new "Failed command 'git #{args.join " "}': #{value.inspect}\n#{error}"
      end
    end

    nil
  end

end
