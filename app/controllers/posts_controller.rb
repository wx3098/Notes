class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(bord_params)
     if @post.save
     redirect_to new_post_path,notice: "メモを作成しました"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def bord_params
    params.require(:post).permit(:content)
  end
end
