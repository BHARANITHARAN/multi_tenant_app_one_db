class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  # get 'errors/not_found'
  # constraints subdomain: /.*/ do
  #   get '/', to: 'articles#index', as: 'subdomain_root'
  #   resources :articles
  # end
  #
  # root 'authors#new'

  # match '*unmatched', to: redirect('/'), via: :all
  constraints(SubdomainConstraint) do
    root 'articles#index', as: :subdomain_root
    resources :articles

    match '*unmatched', to: 'errors#not_found', via: :all, as: 'subdomain_not_found'
  end
  constraints(SubdomainBlank) do
    root 'authors#index'
    resources :authors

    match '*unmatched', to: 'errors#not_found', via: :all, as: 'domain_not_found'
  end

end






# Rails.application.routes.draw do
#   get 'errors/not_found'
#   # resources :projects, only: [:index]
#   constraints(SubdomainConstraint) do
#     root 'dashboard#index', as: :subdomain_root
#     devise_for :users
#     resources :users, only: :index
#     resources :projects
#   end
#
#   constraints(SubdomainBlank) do
#     root 'welcome#index'
#     resources :accounts, only: [:new, :create]
#   end
# end

