class ImportantPhotosController < ApplicationController
    #Permissions
    before_action :authenticate_user!
    before_action :object_owner?, only: [:show, :edit, :update, :destroy]
    ###########################


    def new
        @important_photo = ImportantPhoto.new
    end

    def create
        @important_photo = ImportantPhoto.new(allowed_params)
        @important_photo.user = current_user
    
        if @important_photo.save
            flash[:notice] = "Your photo '#{@important_photo.title}' has successfully been saved."
            redirect_to(important_photo_path(@important_photo.id))
        else
            flash.now[:alert] = "Photo not saved, please try again."
            render(:new)
        end
    end

    def show
        @important_photo = ImportantPhoto.find(params["id"])
    end

    def index
        @important_photos = ImportantPhoto.where({ user: current_user})
    end

    def edit
        @important_photo = ImportantPhoto.find(params["id"])
    end

    def update
        @important_photo = ImportantPhoto.find(params["id"])
        @important_photo.assign_attributes(allowed_params)

        if @important_photo.save
            flash[:notice] = "Your photo '#{@important_photo.title}' has successfully been updated."
            redirect_to(important_photo_path(@important_photo.id))
        else
            flash.now[:alert] = "Photo not updated, please try again."
            render(:edit)
        end
    end

    def destroy
        @important_photo = ImportantPhoto.find(params["id"])
        if @important_photo.destroy
            flash[:alert] = "Your photo '#{@important_photo.title}' has successfully been deleted."
            redirect_to(important_photos_path)
        else
            flash.now[:alert] = "Error deleting photo, please try again."
            render(:show)
        end
    end
end







private
    def object_owner?
        unless ImportantPhoto.find(params["id"]).user == current_user
            flash[:alert] = "Unauthorised Action"
            redirect_to(root_path)
        end
    end

    def allowed_params
        params.require(:important_photo).permit(:title, :description, :important_photo, :remove_important_photo)
    end 