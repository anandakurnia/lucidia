Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "api/v1" do
    get "/doctors", to: "doctor#getAll"
    get "/hospitals", to: "hospital#getAll"
    get "/schedules", to: "schedule#getAll"
    post "/appoinments", to: "appointment#create"

    post "/register", to: "patient#register"
    post "/login", to: "patient#login"
    get "/logout", to: "patient#logout"
  end
end
