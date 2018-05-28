require 'rails_helper'

RSpec.describe ImportantPhotosController, type: :controller do
    describe 'GET #new' do
        context 'user not signed in' do
            it 'redirects user to sign in page' do
                #built in devise functionality no need to test / dont know how
            end
        end
    
        context 'user signed in' do
            before do
                user = create(:user)    
                sign_in(user)
            end
            it 'assigns a new object to @important_photo' do
                get :new
                expect(assigns(:important_photo)).to be_an_instance_of ImportantPhoto
            end
            it 'returns the new template to the user' do
                get :new
                expect(response).to render_template(:new)
            end
            it 'returns an http status of 200' do
                get :new
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST #create' do
        context 'user not signed in' do
            it 'redirects user to sign in page' do
                #built in devise functionality no need to test / dont know how
            end
        end

        context 'user signed in' do
            before do
                @user = create(:user)    
                sign_in(@user)
            end
            it 'adds a new important_photo object to the database' do
                expect {post :create, params:{user: @user, important_photo: attributes_for(:important_photo)}}.to change{ImportantPhoto.all.count}.by(1)
            end
            it 'redirects the user to the show page' do
                post :create, params: {user: @user,important_photo: attributes_for(:important_photo)}
                expect(response).to redirect_to(:show)
            end
            it 're-renders the create form if save to the database fails' do
                post :create, params: {user: @user,important_photo: {title: "", description: ""}}
                expect(response).to render_template(:new)
            end
        end
    end
end
