class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
    end
  end

  def delete
  end
end
