class Api::V1::ListsController < ApplicationController

  def create
    @user = User.find_by(fb_id: params[:userID])
    @user.lists << List.create(name: params[:listName])
    render json: @user.lists
  end

  def destroy
    @user = User.find_by(fb_id: params[:userID])
    @user.lists.find_by(name: params[:listName]).destroy
    render json: @user.lists
  end

end
