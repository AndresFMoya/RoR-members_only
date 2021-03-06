# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash.now[:success] = 'Succesful Log in!'
      render 'posts/new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
