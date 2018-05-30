class AddImportantPhotoToImportantPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :important_photos, :important_photo, :string
  end
end
