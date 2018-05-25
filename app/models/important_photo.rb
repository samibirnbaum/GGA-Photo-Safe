class ImportantPhoto < ApplicationRecord
  #Model Attributes
  #@Title
  #@Description
  #@user_id

  #Model Validations
  validates_presence_of :title, :description

  #Model Associations
  belongs_to :user
end
