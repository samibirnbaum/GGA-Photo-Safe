require 'rails_helper'

RSpec.describe User, type: :model do
  # All the major testing is handled by 3rd-party gem devise 

  describe 'associations' do
    it { should have_many(:important_photos) }
  end
end
