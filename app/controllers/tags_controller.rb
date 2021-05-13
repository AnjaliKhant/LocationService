class TagsController < ApplicationController
    def index
        if params[:type].present?
            @places = Place.eager_load(:tag).where("tags.tag_0 like ? or tag_1 like ? or tag_2 like ? or tag_3 like ?" , "%#{params[:type]}%", "%#{params[:type]}%", "%#{params[:type]}%", "%#{params[:type]}%")
        else
            @places = Place.eager_load(:tag)
        end
    end
end