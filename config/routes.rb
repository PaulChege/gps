Rails.application.routes.draw do
  # resources :points  do
  #   collection {post :import}
  #   get :data
  # end

  get 'points/data', :to => 'points#data'
  get 'points/results', :to => 'points#results'
  post 'points/import', :to => 'points#import'
  post 'points/search', :to => 'points#search'

  root to: "points#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
