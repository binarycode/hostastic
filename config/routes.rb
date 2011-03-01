Hostastic::Application.routes.draw do
  devise_for :users

  root :to => "tickets#new"

  resources :tickets, :only => [:index, :show, :create, :update] do
    collection do
      get :open
      get :on_hold
      get :closed
      get :search
    end
    member do
      get :take_ownership
    end
    resources :replies
  end
end
