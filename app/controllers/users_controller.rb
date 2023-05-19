class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id

    redirect_to room_url(params[:room_id])
  end

  private

  def user_params
    params.permit(:username)
  end
end
