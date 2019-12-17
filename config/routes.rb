Rails.application.routes.draw do

  as :user do
    put '/user/confirmation' => 'confirmations#update', :via => :path, :as => :update_user_confirmation
  end


  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmation: 'confirmations'
  }
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
