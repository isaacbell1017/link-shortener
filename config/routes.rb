Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :links
  post '/clicked-count',
    to: 'links#increment_clicked_count',
    as: 'increment_clicked_count'

  root 'links#index'
end
