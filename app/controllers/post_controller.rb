class PostController < ApplicationController
  before_action :authenticate_user, {only:[:new,:create,:edit,:update,:destory]}
  before_action :ensure_correct_user, {only: [:edit,:update,:destory]}

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.create params.require(:post).permit(:title,:content_1,:content_2, :image)
    @post.user_id = @current_user.id
    @post.save
    redirect_to("/index")
  end

  def show
    @post= Post.find_by(id:params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.update params.require(:post).permit(:title, :content_1, :content_2, :image)
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/post/#{@post.id}/show")
    else
      render("post/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/index")
    end  
  end

  def search
    @posts = Post.search(params[:search])
  end

  private

  
end