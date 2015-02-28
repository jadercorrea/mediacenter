module MediaHelper
  include ApplicationHelper

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
end
