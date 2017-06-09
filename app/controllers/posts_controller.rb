class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(post_params)
		
		if @post.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end
	
	def update
		@user = User.find(params[:user_id])
		@post = @user.posts.find(post_params)
 
	    if @post.update(post_params)
			redirect_to @post
	    else
			render 'edit'
	    end
	end
	
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end
	
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
