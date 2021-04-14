class UserController < ApplicationController
  
  before_action :authenticate_user, {only:[:logout]}
  before_action :forbid_login_user, {only: [:new,:create,:login_form,:login]}
  before_action :ensure_correct_user, {only: [:edit,:uodate]}

  def show
    @user = User.find_by(id:params[:id])
    @posts = @user.posts
  end
  
  def new
    @user = User.new()
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      image_name: "default_img.png"
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}/show")
    else
      render("user/new")
    end  
  end

  def login_form

  end

  def login
    @user = User.find_by(
      name: params[:name],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      redirect_to("/user/#{@user.id}/show")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/home/top")
  end

  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user=User.find_by(id:params[:id])
    @user.name=params[:name]
    @user.password=params[:password]

    if params[:image]
      
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_image/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice]="編集が完了しました"  
      redirect_to("/user/#{@user.id}/show")
    else
      render("user/edit")  
    end  
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/index")
    end  
  end

  def likes
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id:@user.id)
  end

end
