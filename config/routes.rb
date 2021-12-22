Rails.application.routes.draw do
  root 'xls_forms#index'
  get 'xls_forms/index'
  get 'xls_forms/error'
  resources :xls_forms
  resources :calc_results
  get 'calc_results/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
