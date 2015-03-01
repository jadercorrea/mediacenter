module ApplicationHelper
  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')', '/']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end

  def directories(root_path, subdirectory = '')
    Dir.glob("#{root_path}/#{subdirectory}**/*/")
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end

  def files(files_path, subdirectory = '')
    Dir.glob("#{files_path}/#{subdirectory}**.*")
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end
end
