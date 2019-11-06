class UsersController < ApplicationController
  

  def new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  
end
