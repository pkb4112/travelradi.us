Rails.application.routes.draw do
  
  root 'static_pages#home'


  get '/origins/new', to: 'origins#create'
  delete '/origins/', to: 'origins#destroy'

  get '/destinations/new', to: 'destinations#create'
  delete '/destinations/', to: 'destinations#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
