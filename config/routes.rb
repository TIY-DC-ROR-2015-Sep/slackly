Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :auth }

  get "/other/route" => "messages#demo"

  get "/:room_name" => "messages#index"
  get "/:room_name/messages" => "messages#message_data"
end
