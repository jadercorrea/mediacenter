module MediaHelper
  def has_collection?(dir)
    instance = instance_eval("@#{sanitize(dir)}")
    unless instance.empty?
      @collection = instance
    end
  end

  def media_path(dir, media)
    return media if dir == 'root'
    "#{dir}/#{media}"
  end

  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end
end
