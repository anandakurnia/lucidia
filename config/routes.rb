Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/doctors", to: "doctor#getAll"
  get "/hospitals", to: "hospital#getAll"
end
