class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_mode

  # GET /users
  def index
    if @trainer_mode
      @users = User.players.where(trainer_id: current_user.id)
    else
      @users = User.find(current_user.id)
    end
    # @groups = Group.all
  end

  # GET /users/1
  def show
  end
    
  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :birthDate, :sex, :type, :trainer_id, :group_id)
    end
    
    def set_mode
      @trainer_mode = false
      if !current_user.nil?
        @trainer_mode = current_user.type == 'Trainer'
      end  
    end  
end
