Rails.application.routes.draw do

  root 'welcome#index'

  resources :todo

  scope :user do
    get '', to: 'user#show', as: 'user'
    post '', to: 'user#create', as: 'user_index'
    patch '', to: 'user#update'
    put '', to: 'user#update'
    delete '', to: 'user#destroy'
  end

end
