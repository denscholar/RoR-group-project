Rails.application.routes.draw do
    # get 'public_recipes/index'
  # get 'recipe_foods/new'
  # get 'shopping_list/index'
  # get 'recipes/index'
  # get 'recipes/show'
  # get 'recipes/new'
  devise_for :users

   # get 'users/index'
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root "public_recipes#index"

  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index]
  resources :users do 
    resources :recipes, except: [:update, :edit] do
      resources :recipe_foods, only: [:new]
      resources :shopping_list, only: [:index]
      
      resources :foods, only: [:index] do
        resources :recipe_foods, only: [ :create, :destroy]
      end
    end
    resources :foods, only: [:index, :create, :new, :destroy]

  end


end
