Rails.application.routes.draw do
  get "/galleries" => "galleries#index"
  get "/galleries/new" => "galleries#new"
  get "/galleries/:id" => "galleries#show", as: :gallery
  post "/galleries" => "galleries#create"
  delete "/galleries/:id" => "galleries#destroy"
  get "/galleries/:id/edit" => "galleries#edit"
  patch "/galleries/:id" => "galleries#update"
end
