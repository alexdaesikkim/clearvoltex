class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@user = User.find(params[:comment][:user_id])
    @difficulty = Difficulty.find(params[:comment][:difficulty_id])
		if (@user.rating < 0) && (@user.comments.count > 10)
			@comment.approved = false
		end
		if @comment.save
      @user.likes @comment
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
    @user = User.find(params[:comment][:user_id])
    if @user
  end

  def downvote
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
