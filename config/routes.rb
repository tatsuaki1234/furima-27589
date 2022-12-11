Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items,     only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders,    only: [:index, :create]
  end
end



# item_orders GET    /items/:item_id/orders(.:format)           orders#index
# item_orders POST   /items/:item_id/orders(.:format)           orders#create
#itemコントローラーにorderが子としてネストされている