class DanStatController < ApplicationController
	def update_clearstats
    @danstat = DanStat.where(:user_id=>params[:danstat][:user_id]).where(:dan_id=>params[:danstat][:dan_id]).first
    @user = User.find(params[:danstat][:user_id])
    if(!@danstat.nil?)
      clears = ["dan_not_played", "dan_failed", "dan_cleared", "dan_UC", "dan_PUC"]
      clearstate = @danstat.clear
      x = 0
      case clearstate
        when "dan_not_played"
          x = 1
        when "dan_failed"
          x = 2
        when "dan_cleared"
          x = 3
        when "dan_UC"
          x = 4
        else
          x = 0 
      end
      @danstat.clear = clears[x]
      @danstat.save
    else
      @danstat = DanStat.new(danstat_params)
      @danstat.clear = "dan_failed"
      @danstat.score = "not_played"
      @danstat.save
    end
    @user.update_dan
    respond_to do |format|
      format.json {render :json => {:clear => @danstat.clear}}
    end
  end

  def update_scorestats
    @danstat = DanStat.where(:user_id=>params[:danstat][:user_id]).where(:dan_id=>params[:danstat][:dan_id]).first
    @user = User.find(params[:danstat][:user_id])
    if(!@danstat.nil?)
      scores = ["not_played", "D", "C", "B", "A", "Aplus", "AA", "AAplus", "AAA", "AAAplus", "S"]
      scorestate = @danstat.score
      x = 0
      case scorestate
        when "not_played"
          x = 1
        when "D"
          x = 2
        when "C"
          x = 3
        when "B"
          x = 4
        when "A"
          x = 5
        when "Aplus"
          x = 6
        when "AA"
          x = 7
        when "AAplus"
          x = 8
        when "AAA"
          x = 9
        when "AAAplus"
          x = 10
        else
          x = 0 
      end
      @danstat.score = scores[x]
      @danstat.save
    else
      @danstat = DanStat.new(danstat_params)
      @danstat.clear = "dan_not_played"
      @danstat.score = "D"
      @danstat.save
    end
    @user.update_dan
    respond_to do |format|
      format.json {render :json => {:score => @danstat.score}}
    end
  end
  private
  	def danstat_params
      params.require(:danstat).permit(:user_id, :dan_id)
    end
end
