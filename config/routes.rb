# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        articles#index
#                  articles GET    /articles(.:format)                                                                      articles#index
#                           POST   /articles(.:format)                                                                      articles#create
#               new_article GET    /articles/new(.:format)                                                                  articles#new
#              edit_article GET    /articles/:id/edit(.:format)                                                             articles#edit
#                   article GET    /articles/:id(.:format)                                                                  articles#show
#                           PATCH  /articles/:id(.:format)                                                                  articles#update
#                           PUT    /articles/:id(.:format)                                                                  articles#update
#                           DELETE /articles/:id(.:format)                                                                  articles#destroy
#                    signup GET    /signup(.:format)                                                                        users#new
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles

  get 'signup', to: 'users#new'
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'

  resources :categories, except: %i[destroy]
end
