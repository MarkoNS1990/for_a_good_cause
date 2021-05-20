Rails.application.routes.draw do
  devise_for :users
  
  resources :users , only:[:index, :show]
  resources :charities do
    resources :donations, only: [:create, :destroy]

  end
    
  

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#home"
  
end
