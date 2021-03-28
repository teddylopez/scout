Rails.application.routes.draw do
  devise_for :users
  resources :scouting_reports

  root to: "scouting_reports#index", report_type: 'all'
end
