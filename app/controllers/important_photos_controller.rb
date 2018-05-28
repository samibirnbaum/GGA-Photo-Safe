class ImportantPhotosController < ApplicationController
    #Permissions
    before_action :authenticate_user!
    #before action make sure user owns the resource they are doing something with - destroy/show/edit/update
    ###########################


    def new
        @important_photo = ImportantPhoto.new
    end

    def create
        @important_photo = ImportantPhoto.new
        @important_photo.user = current_user
        @important_photo.title = params["important_photo"]["title"]
        @important_photo.description = params["important_photo"]["description"]

        if @important_photo.save
            flash[:notice] = "Your photo '#{@important_photo.title}' has successfully been saved."
            redirect_to(important_photo_path(@important_photo.id))
        else
            flash.now[:alert] = "Photo not saved, please try again."
            render(:new)
        end
    end
end
