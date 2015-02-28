class MediaController < ApplicationController
  include FileMapping
  include ApplicationHelper
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
    @directories.push(params[:videos_path])
    instance_eval("@#{sanitize(params[:videos_path])} = files(params[:videos_path])")
  end

  def directory_mapping
    DirectoryMapping::directories(params[:videos_path])
  end
end
