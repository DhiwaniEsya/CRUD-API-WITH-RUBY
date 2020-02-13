Rails.application.routes.draw do
    get 'users' => 'home#index'
    get 'users/:id' => 'home#show'
    post 'users' => 'home#create'
    put 'users/:id' => 'home#update'
    delete 'users/:id' => 'home#destroy'
  end
  