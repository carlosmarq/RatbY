Rails.application.routes.draw do
  resources :servers do
    collection do
      post 'listen'
    end
  end
  #devise_for :models



  #match '/servers/listen', to: 'servers#listen', via: [:get, :post]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
