module FileLib
  extend self

  def with_temp_path(prefix = "")
    t = Tempfile.new(prefix)

    yield t.path

  ensure
    t.close!
  end
end
