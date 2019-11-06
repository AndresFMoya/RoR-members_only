class PostsController < ApplicationController
  include SessionsHelper
  include PostsHelper
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to 'index'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
