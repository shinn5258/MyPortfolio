class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  
  

  def index
    @users = User.all
  end

  def show
  end

  def add
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to "/users/#{@user.id}"
    else
      render '/users/add'
    end
  end

  def login_form
    # @account = current_account
    # @msg = 'ログインしています。' 
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def edit
    # @user = Post.find params[:id]
    if request.patch?
      if @user.update(user_params)
        flash[:notice] = "ユーザー情報を編集しました"
      end
      redirect_to '/users/index'
    end
  end

  

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  private
  def set_user
    @user = User.find params[:id]
  end

end
