class PostsController < ApplicationController
  include sessions_helper
  include posts_helper
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    end
  end

  def index
  end


end
