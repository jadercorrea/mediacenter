class MediaController < ApplicationController
  include FileMapping
  before_action :load_resources, only: [:index]

  def watch
    call_rake :watch_video, media: params[:media]
    redirect_to :back, path: params[:path], notice: "Playing video: #{params[:media]}"
  end

  def index
  end

  private

  def load_resources
    @directories = directory_mapping
    @directories.each do |dir|
      instance_eval("@#{sanitize(dir)} = files(params[:videos_path], '#{dir}/')")
    end
    @directories.push('root')
    @root = files(params[:path])
  end

  def directory_mapping
    params[:videos_path] = "app/assets/videos" unless params[:videos_path].present?
    DirectoryMapping::directories(params[:videos_path])
  end

  def sanitize(dir)
    special_char_mapping = [' ', '-', '(', ')']
    special_char_mapping.each do |char|
      dir = dir.gsub(char, '_')
    end
    dir.downcase
  end
end
