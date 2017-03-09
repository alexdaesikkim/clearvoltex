class HomeController < ApplicationController
	def stats
		@user = current_user
	    @userstats = @user.userstats
	    #@level_15 = @userstats.joins(:difficulty).where("level = 15")
	    #@level_16 = @userstats.joins(:difficulty).where("level = 16")
	    @clear17 = @userstats.joins(:difficulty).where("level = 17")
	    @clear18 = @userstats.joins(:difficulty).where("level = 18")
	    @clear19_20 = @userstats.joins(:difficulty).where("level = 19 OR level = 20")

	    @titles = ["All Songs", "Level 17", "Level 18", "Level 19~20"]

	    @failed = [
	      @userstats.where("clear = ?", "failed"),
	      @clear17.where("clear = ?", "failed"),
	      @clear18.where("clear = ?", "failed"),
	      @clear19_20.where("clear = ?", "failed")
	    ]
	    @cleared = [
	      @userstats.where("clear = ?", "cleared"),
	      @clear17.where("clear = ?", "cleared"),
	      @clear18.where("clear = ?", "cleared"),
	      @clear19_20.where("clear = ?", "cleared")
	    ]
	    @excessive = [
	      @userstats.where("clear = ?", "excessive"),
	      @clear17.where("clear = ?", "excessive"),
	      @clear18.where("clear = ?", "excessive"),
	      @clear19_20.where("clear = ?", "excessive")
	    ]
	    @UC = [
	      @userstats.where("clear = ?", "UC"),
	      @clear17.where("clear = ?", "UC"),
	      @clear18.where("clear = ?", "UC"),
	      @clear19_20.where("clear = ?", "UC")
	    ]
	    @PUC = [
	      @userstats.where("clear = ?", "PUC"),
	      @clear17.where("clear = ?", "PUC"),
	      @clear18.where("clear = ?", "PUC"),
	      @clear19_20.where("clear = ?", "PUC")
	    ]
	end
end
