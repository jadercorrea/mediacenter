desc "Watch video"
task :watch_video do
  `open "#{ENV["MEDIA"]}"`
end
