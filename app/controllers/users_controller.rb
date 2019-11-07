# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

<<<<<<< HEAD
  def show
    @user = User.find(params[:id])
  end
=======
  def show; end
>>>>>>> 4467325652115d2d5f222987f546b33a3b122b38
end
