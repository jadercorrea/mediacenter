class MediaController < ApplicationController
  include FileMapping
  before_action :load_resources

  def index
  end

  private

  def load_resources
    @directories = directory_mapping
    @directories.each do |dir|
      instance_eval("@#{sanitize(dir)} = files(params[:path], '#{dir}/')")
    end
    @directories.push('root')
    @root = files(params[:path])
  end

  def directory_mapping
    params[:path] = "app/assets/videos" unless params[:path].present?
    DirectoryMapping::directories(params[:path])
  end

  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end
end
