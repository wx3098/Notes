class PostsController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all 
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(note_params)
     if params[:back]
     render :new
    else
     if @post.save
       redirect_to posts_path, notice: "Noteを作成しました"
    else
      render :new
      end
    end
  end

  def confirm 
    @post = Post.new(note_params)
    render :new if @post.invalid?
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(note_params)
      redirect_to posts_path, notice: "Noteを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Noteを削除しました"
  end


  private

  def note_params
    params.require(:post).permit(:content)
  end

  def set_note
    @post = Post.find(params[:id])
  end
end
