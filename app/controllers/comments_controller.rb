class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@user = User.find(params[:comment][:user_id])
		if (@user.rating < 0) && (@user.comments.count > 10)
			@comment.approved = false
		end
		respond_to do |format|
			if @comment.save
  				format.json {render :json => {}}
  			else
  				format.json {render :json => {}}
  			end
  		end
    end

	def destroy
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :difficulty_id, :content)
    end

end
