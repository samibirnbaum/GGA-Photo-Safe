Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "welcome#index"

  devise_for :users
  
  resources :important_photos
end


#   Prefix                     Verb    URI Pattern                               Controller#Action
#   root                       GET     /                                         welcome#index

# new_user_session             GET     /users/sign_in(.:format)                  devise/sessions#new
# user_session                 POST    /users/sign_in(.:format)                  devise/sessions#create
# destroy_user_session         DELETE  /users/sign_out(.:format)                 devise/sessions#destroy

# new_user_password            GET     /users/password/new(.:format)             devise/passwords#new
# edit_user_password           GET     /users/password/edit(.:format)            devise/passwords#edit
# user_password                PATCH   /users/password(.:format)                 devise/passwords#update
#                              PUT     /users/password(.:format)                 devise/passwords#update
#                              POST    /users/password(.:format)                 devise/passwords#create

# cancel_user_registration     GET     /users/cancel(.:format)                   devise/registrations#cancel
#     new_user_registration    GET     /users/sign_up(.:format)                  devise/registrations#new
#    edit_user_registration    GET     /users/edit(.:format)                     devise/registrations#edit
#         user_registration    PATCH   /users(.:format)                          devise/registrations#update
#                              PUT     /users(.:format)                          devise/registrations#update
#                              DELETE  /users(.:format)                          devise/registrations#destroy
#                              POST    /users(.:format)                          devise/registrations#create

# important_photos             GET     /important_photos(.:format)               important_photos#index
#                              POST    /important_photos(.:format)               important_photos#create
# new_important_photo          GET     /important_photos/new(.:format)           important_photos#new
# edit_important_photo         GET     /important_photos/:id/edit(.:format)      important_photos#edit
# important_photo              GET     /important_photos/:id(.:format)           important_photos#show
#                              PATCH   /important_photos/:id(.:format)           important_photos#update
#                              PUT     /important_photos/:id(.:format)           important_photos#update
#                              DELETE  /important_photos/:id(.:format)           important_photos#destroy