Rails.application.routes.draw do

  resources :campaigns, only: [:create, :show, :redeem_code] do
    put 'redeem_code', on: :member
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
