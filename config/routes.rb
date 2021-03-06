Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'places#index'

  resources :places do
    collection do
      post :import
      get  :search
    end
  end

  get "tags/:type", to: "tags#index", as: "tags"
end
