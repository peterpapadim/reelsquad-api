class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.find_by(fb_id: params[:userID])
    if !@user
      @user = User.create(fb_id: params[:userID], first_name: params[:firstName], last_name: params[:lastName], email: params[:email])
    end
    render json: @user.id
  end

  def lists
    @user = User.find_by(fb_id: params[:userID])
    render json: @user.lists
  end

  def shows
    @user = User.find_by(fb_id: params[:userID])
    @shows = @user.lists.find_by(name: params[:listName]).shows
    render json: @shows
  end

end
