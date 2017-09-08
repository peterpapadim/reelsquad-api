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

  def shows_users
    @user = User.find_by(fb_id: params[:userID])
    @list = @user.lists.find_by(name: params[:listName])
    @shows = @list.shows
    @users = @list.users.select{|user| user.fb_id != @user.fb_id}
    render json: { shows: @shows, users: @users }
  end

  def update_users
    @user = User.find_by(fb_id: params[:userID])
    @list = @user.lists.find_by(name: params[:listName])

    UserList.where(list_id: @list).each { |list_user| list_user.destroy }
    @list.users << @user

    params[:updatedFriends].each do | friend_id |
      @friend = User.find_by(fb_id: friend_id)
      @list.users << @friend
    end
    @users = @list.users.select{|user| user.fb_id != @user.fb_id}
    render json: @users
  end

end
