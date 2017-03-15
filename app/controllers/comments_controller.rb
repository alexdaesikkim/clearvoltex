class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@user = User.find(params[:comment][:user_id])
    	@difficulty = Difficulty.find(params[:comment][:difficulty_id])
		if (@user.rating < 0) && (@user.comments.count > 10)
			@comment.approved = false
		end
		if @comment.save
	      @user_vote = Vote.new
		  @user_vote.comment_id = @comment.id
		  @user_vote.user_id = params[:comment][:user_id]
		  @user_vote.upvote = true
		  @user_vote.save
	      flash[:success] = "Comment posted!"
		else
			flash[:success] = "Invalid operation"
		end
 	 end

	def destroy
    	@comment.destroy
	    respond_to do |format|
	      format.html { redirect_to difficulties_url, notice: 'Comment was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	def upvote
    	@comment = Comment.find(params[:comment][:id])
		@user_vote = Vote.where("user_id = ? AND comment_id = ?", params[:comment][:user_id], params[:comment][:id]).first
		if @user_vote.nil?
			@user_vote = Vote.new
			@user_vote.comment_id = params[:comment][:id]
			@user_vote.user_id = params[:comment][:user_id]
			@user_vote.upvote = true
			@user_vote.save
      respond_to do |format|
        format.json {render :json => {:status => true, :votes => @comment.user_votes}}
      end
		else
			if @user_vote.upvote == false
				@user_vote.downvote = false
				@user_vote.upvote = true
				@user_vote.save
        respond_to do |format|
          format.json {render :json => {:status => true, :votes => @comment.user_votes}}
        end
			else
				@user_vote.upvote = false
				@user_vote.save
        respond_to do |format|
          format.json {render :json => {:status => false, :votes => @comment.user_votes}}
        end
			end
		end
	end

	def downvote
    	@comment = Comment.find(params[:comment][:id])
		@user_vote = Vote.where("user_id = ? AND comment_id = ?", params[:comment][:user_id], params[:comment][:id]).first
		if @user_vote.nil?
			@user_vote = Vote.new
			@user_vote.comment_id = params[:comment][:id]
			@user_vote.user_id = params[:comment][:user_id]
			@user_vote.downvote = true
			@user_vote.save
      respond_to do |format|
        format.json {render :json => {:status => true, :votes => @comment.user_votes}}
      end
		else
			if @user_vote.downvote == false
        @user_vote.upvote = false
				@user_vote.downvote = true
				@user_vote.save
        respond_to do |format|
          format.json {render :json => {:status => true, :votes => @comment.user_votes}}
        end
			else
				@user_vote.downvote = false
				@user_vote.save
        respond_to do |format|
          format.json {render :json => {:status => false, :votes => @comment.user_votes}}
        end
			end
		end
	end

	def destroy
		@comment.destroy
	    respond_to do |format|
	      format.html { redirect_to difficulties_url, notice: 'Difficulty was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:id, :user_id, :difficulty_id, :content)
    end

end
