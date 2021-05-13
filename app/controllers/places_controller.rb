class PlacesController < ApplicationController
    def index
    end

    def import
        Place.import(params[:file])
        redirect_to root_url, notice: 'Places Uploaded successfully'
    end
end