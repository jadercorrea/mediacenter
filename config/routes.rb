Rails.application.routes.draw do
  resources :medias, only: [:index]
  post :watch, to: 'media#watch'
  root 'media#index', videos_path: "#{ENV["HOME"]}/Videos"
end
