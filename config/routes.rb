Rails.application.routes.draw do
  devise_for :admins
  root to: redirect('/admin')
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index] do
        member do
          get :products
        end
      end
      resources :sub_categories, only: %i[] do
        member do
          get :products
        end
      end
      resources :products, only: %i[show] do
        collection do
          get :search
        end
        member do
          get :related
        end
      end
    end
  end
end
