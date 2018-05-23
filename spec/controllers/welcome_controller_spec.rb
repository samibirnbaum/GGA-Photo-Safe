require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    describe 'GET #index' do
      it 'returns the index view' do
          get :index
          expect(response).to render_template(:index)
      end
      it 'has an http success status' do
          get :index
          expect(response).to have_http_status(200)
      end
    end
end
