Rails.application.routes.draw do
  resources :posts do
    collection do
      post :confirm
      root to: 'post#create'
    end
  end
end
