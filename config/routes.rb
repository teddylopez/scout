Rails.application.routes.draw do
  resources :scouting_reports

  root to: "scouting_reports#index", report_type: 'all'
end
