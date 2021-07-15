Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "static_pages/home"
    get "sessions/new"
    get "signup", to: "users#new"
    get "/login", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :courses
    resources :course_users
    resources :users do
      resources :courses, only: :show do
        get "/subjects", to: "course_users#show"
        resources :subjects do
          get "/tasks", to: "course_users#show_tasks"
        end
      end
    end
  end
end
