class PlacesController < ApplicationController
    def index
    end

    def import
        Place.import(params[:file])
        redirect_to root_url, notice: 'Places Uploaded successfully'
    end

    def search
        if params[:lat].present? && params[:lng].present?
            @places = Place.near([params[:lat],params[:lng]], 10, units: :km)
        end
    end
end