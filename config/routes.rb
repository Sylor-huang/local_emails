Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'local_emails#index'
  resources :local_emails, except:[:index] do
    member do
      post :send_mail
    end
  end
end
