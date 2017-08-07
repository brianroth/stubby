Rails.application.routes.draw do

  get ':slug' => 'links#show'
  
  namespace :admin do
    resources :links
  end

  # You can have the root of your site routed with "root"
  root 'admin/links#index'
  match "*path", :to => "application#render_not_found", via: [:get, :post]
end
