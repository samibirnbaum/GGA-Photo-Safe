class ImportantPhotosController < ApplicationController
    #Permissions
    before_action :authenticate_user!
    before_action :object_owner?, only: [:show, :edit, :update, :destroy]
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

    def show
        @important_photo = ImportantPhoto.find(params["id"])
    end

    def index
        @important_photos = ImportantPhoto.where({ user: current_user})
    end
end







private
    def object_owner?
        unless ImportantPhoto.find(params["id"]).user == current_user
            flash[:alert] = "Unauthorised Action"
            redirect_to(root_path)
        end
    end