Rails.application.routes.draw do
  root 'xls_forms#index'
  get 'xls_forms/index'
  get 'xls_forms/:name' do
    erb :hello, :locals => {:name => params[:name]}
  end
  resources :xls_forms
  resources :data
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
