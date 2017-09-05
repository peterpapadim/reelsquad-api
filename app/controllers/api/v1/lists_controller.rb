class Api::V1::ListsController < ApplicationController

  def create
    @user = User.find_by(fb_id: params[:userID])
    @user.lists << List.create(name: params[:listName])
    render json: @user.lists
  end

end
