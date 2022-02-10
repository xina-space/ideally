Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :categories do
    resources :progresses, except: [:index, :show] do
      resources :ideas, except: [:index, :show]
    end
  end

end
