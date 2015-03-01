class MediaController < ApplicationController
  include ApplicationHelper
  before_action :load_resources, only: [:index]

  def watch
    call_rake :watch_video, media: params[:media]
    redirect_to :back, videos_path: params[:videos_path], notice: "Playing video: #{params[:media]}"
  end

  def index
  end

  private

  def load_resources
    @directories = directories(params[:videos_path])
    to_instances
  end

  def to_instances
    @directories.each do |dir|
      evaluate(dir)
    end
    @directories.push(params[:videos_path])
    evaluate(params[:videos_path])
  end

  def evaluate(dir)
    instance_eval("@#{sanitize(dir)} = files(params[:videos_path], '#{dir}/')")
  end
end
