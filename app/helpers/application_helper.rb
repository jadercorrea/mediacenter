module ApplicationHelper
  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')', '/']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end
end
