# frozen_string_literal: true

class PostsController < ApplicationController
  include SessionsHelper
  include PostsHelper
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    return unless @post.save

    flash[:success] = 'Post created!'
    redirect_to posts_path
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
