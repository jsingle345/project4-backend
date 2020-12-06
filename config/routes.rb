Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :authors
      resources :notes
      post '/auth', to: 'auth#create'
    end
  end
end
