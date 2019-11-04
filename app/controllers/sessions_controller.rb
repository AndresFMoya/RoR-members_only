class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    user && user.authenticate(params[:session][:password])
  end
end
