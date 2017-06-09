Rails.application.routes.draw do
	get 'welcome/index'
	
	resources :users do
		resources :postings
	end
	
	root 'welcome#index'
end
