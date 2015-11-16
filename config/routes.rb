Bloccit::Application.routes.draw do
  
resources :topics do

	resources :posts, except: [:index]

end

	resources :users, only: [:new, :create]

	post 'users/confirm' => 'users#confirm'


  get 'about' => 'welcome#about'

 

  get 'welcome/contact'

  get 'welcome/faq'



 
root to: 'welcome#index'

  

  

end
