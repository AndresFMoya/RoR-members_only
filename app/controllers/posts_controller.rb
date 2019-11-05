class PostsController < ApplicationController
  include sessions_helper
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end


end
