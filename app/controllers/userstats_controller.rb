class UserstatsController < ApplicationController
  before_action :set_userstat, only: [:show, :edit, :update, :destroy]

  # GET /userstats
  # GET /userstats.json
  def index
    @userstats = Userstat.all
  end

  # GET /userstats/1
  # GET /userstats/1.json
  def show
  end

  # GET /userstats/new
  def new
    @userstat = Userstat.new
  end

  # GET /userstats/1/edit
  def edit
  end

  # POST /userstats
  # POST /userstats.json
  def create
    @userstat = Userstat.new(userstat_params)
    @userstat.clear = "not_played"

    respond_to do |format|
      if @userstat.save
        format.html { redirect_to @userstat, notice: 'Userstat was successfully created.' }
        format.json { render :show, status: :created, location: @userstat }
      else
        format.html { render :new }
        format.json { render json: @userstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userstats/1
  # PATCH/PUT /userstats/1.json
  def update
    respond_to do |format|
      if @userstat.update(userstat_params)
        format.html { redirect_to @userstat, notice: 'Userstat was successfully updated.' }
        format.json { render :show, status: :ok, location: @userstat }
      else
        format.html { render :edit }
        format.json { render json: @userstat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_clearstats
    @userstat = Userstat.where(:user_id=>params["user_id"]).where(:difficulty_id=>params["diff_id"]).first
    if(!@userstat.nil?)
      puts "case1"
      clears = ["not_played", "failed", "cleared", "excessive", "UC", "PUC"]
      clearstate = @userstat.clear
      x = 0
      case clearstate
      when "not_played"
        x = 1
      when "failed"
        x = 2
      when "cleared"
        x = 3
      when "excessive"
        x = 4
      when "UC"
        x = 5
      else
        x = 0 
      end
      @userstat.clear = clears[x]
      @userstat.save
    else
      puts "case2"
      @userstat = Userstat.new
      @userstat.difficulty_id = params["diff_id"]
      @userstat.user_id = params["user_id"]
      @userstat.clear = "failed"
      @userstat.save
    end
    respond_to do |format|
      format.json {render :json => {:clear => @userstat.clear}}
    end
  end

  # DELETE /userstats/1
  # DELETE /userstats/1.json
  def destroy
    @userstat.destroy
    respond_to do |format|
      format.html { redirect_to userstats_url, notice: 'Userstat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userstat
      @userstat = Userstat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userstat_params
      params.require(:userstat).permit(:user_id, :difficulty_id, :clear)
    end
end
