Rails.application.routes.draw do
  root "watches#index"

  get "watches", to: "watches#index"

  get "quiz", to: "quiz#index"
  post "quiz", to: "quiz#create"
end
