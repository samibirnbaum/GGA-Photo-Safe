require 'rails_helper'

RSpec.describe ImportantPhoto, type: :model do
  describe 'models attributes' do
    it 'should have the attributes title description and a user_id' do
      create(:important_photo) #factory bot method, saves important_photo and user model to the database
      expect(ImportantPhoto.first.title).to eq("Gas Reading")
      expect(ImportantPhoto.first.description).to eq("Meter reading at Flat 21")
      expect(ImportantPhoto.first.user.email).to eq("sami@sami.com")
    end
  end

  describe 'models validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe 'models associations' do
    it { should belong_to(:user) }
  end
end
