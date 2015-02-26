Rails.application.routes.draw do
  resources :medias, only: [:index]

  directories = Dir.glob("~/videos/**/*/")
    .collect { |media| media.split('/') }
    .map { |path| path.pop }

  directories.each do |dir|
    get dir.to_sym, to: "media##{dir.to_sym}"
  end

  root 'media#index'
end
