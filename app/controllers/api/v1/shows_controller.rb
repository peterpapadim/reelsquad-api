class Api::V1::ShowsController < ApplicationController
  def create
    @user = User.find_by(fb_id: params[:userID])
    @user.lists.find_by(name: params[:listName]).shows << Show.create(title: params[:title], reference_id: params[:refID], show_type: params[:type])
  end
end
