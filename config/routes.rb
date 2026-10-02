Rails.application.routes.draw do
  root "watches#index"

get "watches", to: "watches#index", as: :watches_index

get "quiz", to: "quiz#index", as: :quiz_index
  post "quiz", to: "quiz#create"
end
