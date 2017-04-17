class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.where("role != ?", "admin")
    @users_dan = User.where("role != ?", "admin").order("dan DESC")
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @dans_default = [
      [
        Dan.where("active = true AND level = 7 AND release_date = ?", Date.new(2016,12,28)).order("name ASC"),
        Dan.where("active = true AND level = 7 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 8 AND release_date = ?", Date.new(2016,12,28)).order("name ASC"),
        Dan.where("active = true AND level = 8 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 9 AND release_date = ?", Date.new(2016,12,28)).order("name ASC"),
        Dan.where("active = true AND level = 9 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 10 AND release_date = ?", Date.new(2016,12,28)).order("name ASC"),
        Dan.where("active = true AND level = 10 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 11 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 12 AND release_date = ?", Date.new(2017,2,17)).order("name ASC")
      ],
      [
        Dan.where("active = true AND level = 13 AND release_date = ?", Date.new(2016,12,28)).order("name ASC")
      ]
    ]

    @level_15 = [
      Difficulty.where("active = true AND level = 15 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 15 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_16 = [
      Difficulty.where("active = true AND level = 16 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 16 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_17 = [
      Difficulty.where("active = true AND level = 17 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 17 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_18 = [
      Difficulty.where("active = true AND level = 18 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 18 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_19 = [
      Difficulty.where("active = true AND level = 19 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 19 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
    ]
    @level_20 = [
      Difficulty.where("active = true AND level = 20 AND tier = ?", "S").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "A").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "B").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "C").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "D").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "E").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "F").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "P").order("difficulty_name ASC, song_name ASC"),
      Difficulty.where("active = true AND level = 20 AND tier = ?", "N").order("difficulty_name ASC, song_name ASC")
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
        format.html { redirect_to '/' }
        flash[:success] = "You will receive an email once accepted into beta"
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

  def admin
    @user = current_user
    if current_user.role != "admin"
        redirect_to @user
    end
    @unapproved_users = User.where("active = false AND role = ?", "regular")
  end

  def activate
    @user_update = User.find(params[:user][:id])
    @user_update.active = true
    @user_update.save
    ClearvoltexMailer.manual_activation(@user_update).deliver
    flash[:success] = 'Mail has been sent!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :username, :password, :password_confirmation, :display_name, :email)
    end
end
