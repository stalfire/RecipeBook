class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)
			redirect_to @user
		else
			redirect_to sign_up_path
		end
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			redirect_to edit_user_path(current_user.id)
		end
	end
	def show
		@user = User.find(params[:id])
		if current_user != nil
			@user_following = Follow.where(follower: current_user.id)
			@following = @user_following.find_by(user_id: params[:id])
		end
		@follower = Follow.where(user_id: @user.id).count
		@recipe = Recipe.where(user_id: params[:id]).count
		@user_recipe = Recipe.where(user_id: @user.id)
			@recipe_like = []
			@user_recipe.each do |r|
				rate = Rating.where(recipe_id: r.id)
				@recipe_like << rate
			end
			@total_like = 0
			@recipe_like.each do |c|
				c.each do |c|
				@total_like += 1
				end
			end
	end
	def follow
		@follower = Follow.where(follower: current_user.id)
		@following = @follower.find_by(user_id: params[:format])
		if @following != nil
			@following.destroy
		else
			@follow = Follow.new(follower: current_user.id, user_id: params[:format])
			@follow.save
		end
	end

private

	def user_params
		params.require(:user).permit({avatar: []},:name, :email, :password)
	end

end