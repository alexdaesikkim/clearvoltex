class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @level_15 = [
      Difficulty.where("level = 15 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 15 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_16 = [
      Difficulty.where("level = 16 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 16 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_17 = [
      Difficulty.where("level = 17 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 17 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_18 = [
      Difficulty.where("level = 18 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 18 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_19 = [
      Difficulty.where("level = 19 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 19 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_20 = [
      Difficulty.where("level = 20 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("level = 20 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.role = "regular"

    respond_to do |format|
      if @user.save
        log_in(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.flash, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.flash, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :display_name, :email)
    end
end
