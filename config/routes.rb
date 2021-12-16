Rails.application.routes.draw do
  root 'xls_forms#index'
  get 'xls_forms/index'
  resources :xls_forms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
