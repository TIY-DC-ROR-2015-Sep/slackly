Rails.application.routes.draw do
  devise_for :users

  get "/other/route" => "messages#demo"
  get "/:room_name" => "messages#index"
end
