class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash.now[:success] = "Succesful Log in!"
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def delete
    log_out
    redirect_to root_url
  end
end
