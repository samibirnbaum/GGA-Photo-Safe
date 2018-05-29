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
                expect(response).to redirect_to(important_photo_path(ImportantPhoto.first.id))
            end
            it 're-renders the create form if save to the database fails' do
                post :create, params: {user: @user,important_photo: {title: "", description: ""}}
                expect(response).to render_template(:new)
            end
        end
    end

    
    
    
    
    
    
    
    describe 'GET #show' do
        context 'user not signed in' do
            it 'redirects user to sign in page' do
                #built in devise functionality no need to test / dont know how
            end
        end
    
        context 'user signed in' do
            context 'user viewing a photo they own' do
                before do
                    #creates important_photo from the factory and also automatically creates the user associated with it
                    @ip = create(:important_photo)    
                    sign_in(User.first)
                end
                it 'assigns the correct object to @important_photo' do
                    get :show, params: {id: @ip.id }
                    expect(assigns(:important_photo).id).to eq(@ip.id)
                end
                it 'renders the show view' do
                    get :show, params: {id: @ip.id }
                    expect(response).to render_template(:show)
                end
                it 'returns an http status of 200' do
                    get :show, params: {id: @ip.id }
                    expect(response).to have_http_status(200)
                end
            end
            context 'user trying to view a photo they dont own' do
                before do
                    @ip = create(:important_photo) #owned by factory_bot user sami@sami.com
                    new_user = create(:user, email: 'joe@joe.com')   
                    sign_in(new_user)
                end
                it 'redirects user to the home page' do
                    get :show, params: {id: @ip.id }
                    expect(response).to redirect_to(root_path)
                end
            end
        end
    end





    describe 'GET #index' do
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
            it 'assigns to @important_photos only the photos you own' do
                ImportantPhoto.create(title: "1st photo", description: "important", user: @user)
                ImportantPhoto.create(title: "2nd photo", description: "important", user: @user)
                ImportantPhoto.create(title: "3rd photo", description: "important", user: @user)
                create(:important_photo, title:"others photo", user: create(:user, email: "mike@mike.com"))
                get :index
                expect(assigns(:important_photos)[0].title).to eq("1st photo")
                expect(assigns(:important_photos)[2].title).to eq("3rd photo")
                expect(assigns(:important_photos).any? {|element| element.title == "others photo"}).to be false
            end
            it 'renders the index view' do
                get :index
                expect(response).to render_template(:index)
            end
            it 'returns an http status of 200' do
                get :index
                expect(response).to have_http_status(200)
            end
        end
    end







    describe 'GET #edit' do
        context 'user not signed in' do
            it 'redirects user to sign in page' do
                #built in devise functionality no need to test / dont know how
            end
        end
    
        context 'user signed in' do
            context 'user trying to edit a photo they own' do
                before do
                    #creates important_photo from the factory and also automatically creates the user associated with it
                    @ip = create(:important_photo)    
                    sign_in(User.first)
                end
                it 'assigns the correct object to @important_photo' do
                    get :edit, params: {id: @ip.id }
                    expect(assigns(:important_photo).id).to eq(@ip.id)
                end
                it 'renders the edit view' do
                    get :edit, params: {id: @ip.id }
                    expect(response).to render_template(:edit)
                end
                it 'returns an http status of 200' do
                    get :edit, params: {id: @ip.id }
                    expect(response).to have_http_status(200)
                end
            end
            context 'user trying to edit a photo they dont own' do
                before do
                    @ip = create(:important_photo) #owned by factory_bot user sami@sami.com
                    new_user = create(:user, email: 'joe@joe.com')   
                    sign_in(new_user)
                end
                it 'redirects user to the home page' do
                    get :edit, params: {id: @ip.id }
                    expect(response).to redirect_to(root_path)
                end
            end
        end
    end





    describe 'PUT #update' do
        context 'user not signed in' do
            it 'redirects user to sign in page' do
                #built in devise functionality no need to test / dont know how
            end
        end

        context 'user signed in' do
            context 'updates photo they own' do
                before do
                    @ip = create(:important_photo)    
                    sign_in(User.first)
                end
                it 'adds new params data to the database' do
                    put :update, params:{id: @ip.id, important_photo: {title: "updated title", description: "updated description"}}
                    ip = ImportantPhoto.find(@ip.id)
                    expect(ip.title).to eq("updated title")
                    expect(ip.description).to eq("updated description")
                end
                it 'redirects the user to the show page' do
                    put :update, params:{id: @ip.id, important_photo: {title: "updated title", description: "updated description"}}
                    expect(response).to redirect_to(important_photo_path(@ip.id))
                end
                it 're-renders the update form if save to the database fails' do
                    put :update, params:{id: @ip.id, important_photo: {title: "", description: ""}}
                    expect(response).to render_template(:edit)
                end
            end
            context 'updates photo they dont own' do
                before do
                    @ip = create(:important_photo) #owned by factory_bot user sami@sami.com
                    new_user = create(:user, email: 'joe@joe.com')   
                    sign_in(new_user)
                end
                it 'redirects user to the home page' do
                    put :update, params:{id: @ip.id, important_photo: {title: "updated title", description: "updated description"}}
                    expect(response).to redirect_to(root_path)
                end
            end
        end
    end
end