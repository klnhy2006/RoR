class PostingsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@posting = @user.postings.create(posting_params)
		redirect_to user_path(@user)
	end
	
	def show
		@user = User.find(params[:user_id])
		@posting = @user.postings.find(params[:id])
	end
	
	def destroy
		@user = User.find(params[:user_id])
		@posting = @user.postings.find(params[:id])
		@posting.destroy
		redirect_to user_path(@user)
	end
	
	private
		def posting_params
			params.require(:posting).permit(:title, :content)
		end
end
