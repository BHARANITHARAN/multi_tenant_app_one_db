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
  root 'pages#home'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  constraints(SubdomainConstraint) do
    resources :articles
  end

  # Routes for when there is no subdomain (root domain)
  constraints(SubdomainBlank) do
    resources :authors
    # Handle unmatched routes (optional)
    # match '*unmatched', to: 'errors#not_found', via: :all, as: 'domain_not_found'
  end

end
