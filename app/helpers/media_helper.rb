module MediaHelper
  include ApplicationHelper

  def has_collection?(dir)
    instance = instance_eval("@#{sanitize(dir)}")
    unless instance.empty?
      @collection = instance
    end
    instance.any?
  end

  def has_directories?(directory, subdirectory)
    @directories = directories(directory, subdirectory)
    @directories.any?
  end

  def target_link(target, path, method)
    link_to target, path, method: method, class: 'list-group-item'
  end

  def path_to_target(dir, target)
    return "#{dir}/#{target}" if dir == params[:videos_path]
    "#{params[:videos_path]}/#{dir}/#{target}"
  end
end
