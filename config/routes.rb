Rails.application.routes.draw do
  get "orden_productos/create"

  get "eventos/exportar_excel", to: "eventos#exportar_excel"
  resources :eventos
    get "inventarios/exportar_excel", to: "inventarios#exportar_excel"

  resources :inventarios

resources :ordens do
  resources :orden_productos, only: [ :create, :edit, :update, :destroy ]
  member do
    patch "cerrar"
    get "detalle_compra"
  end
end

      get "productos/exportar_excel", to: "productos#exportar_excel"

  resources :productos
  resources :mesas do
    post "crear_orden", on: :member
  end
  get "productos/search", to: "productos#search"

  devise_for :empleados
    get "empleados/exportar_excel", to: "empleados#exportar_excel"

    resources :empleados


  resources :reportes, only: [ :index ]
  get "reportes/por_fecha/:fecha", to: "reportes#por_fecha", as: "reporte_por_fecha"

  get "home/dashboard"
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
