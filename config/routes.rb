Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#index'

  resources :groups, only: [:index, :show] do
    resources :tasks
  end
  get '/groups/:group_id/tasks/:id/test', to: 'tasks#test', as: 'test_group_task'
end
