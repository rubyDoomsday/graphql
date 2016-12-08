Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # GraphQL IDE
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/queries'

  # GraphQL Controller
  resources :queries, via: [:post, :options]
end
