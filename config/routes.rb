Rails.application.routes.draw do
  get 'static_pages/index'

  get 'static_pages/edit'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    resources :books
    patch 'books/:id/borrow' => 'books#borrow', as: :borrow
    patch 'books/:id/return' => 'books#return', as: :return
  end
  root 'static_pages#index'
end

## LICENSE
## This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
##
