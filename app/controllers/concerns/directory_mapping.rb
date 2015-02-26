module DirectoryMapping
  def self.directories(files_path, subdirectory = '')
    Dir.glob("#{files_path}/#{subdirectory}**/*/")
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end
end
