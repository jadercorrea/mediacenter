module ApplicationHelper
  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')', '/']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end

  def directories(root_path, subdirectory = '')
    Dir.glob( pattern(root_path, subdirectory, '**'))
      .select { |fn| File.directory?(fn) }
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end

  def files(root_path, subdirectory = '')
    Dir.glob( pattern(root_path, subdirectory, '**.*'))
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end

  private

  def matches(flag)
    Dir.glob(flag)
      .select { |fn| File.directory?(fn) }
      .collect { |media| media.split('/') }
      .map { |path| path.pop }
  end

  def pattern(root, subdir, flag)
    return "#{root}/#{flag}" if subdir.empty?
    "#{root}/#{subdir}/#{flag}"
  end
end
