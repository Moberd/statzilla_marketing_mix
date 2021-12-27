Rails.application.routes.draw do
  root 'xls_forms#index'
  get 'xls_forms/index'
  get 'xls_forms/error'
  resources :xls_forms
  resources :calc_results
  get 'calc_results/index'
end