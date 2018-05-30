class ImportantPhoto < ApplicationRecord
  #Model Attributes
  #@title
  #@description
  #@important_photo
  #@user_id

  #Model Validations
  validates_presence_of :title, :description
  validate :important_photo_size_validation

  #Model Associations
  belongs_to :user

  #carrierwave functionality that handles after_save logic to save image file
  #in public folder and keep link to that image in the database
  mount_uploader :important_photo, ImportantPhotoUploader

  
  
  private
    def important_photo_size_validation
      errors[:important_photo] << "should be less than 2.5mb" if important_photo.size > 2.5.megabytes
    end
end



 
