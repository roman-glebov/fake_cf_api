get '/projects', to: 'projects#index'
post '/projects', to: 'projects#create'
post '/projects/:id/run_project', to: 'projects#run_project'
