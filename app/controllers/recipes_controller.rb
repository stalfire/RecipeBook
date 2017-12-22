class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(params_for_recipe)
		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to root_path
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def index
		@recipes = Recipe.all
	end

private
	
	def params_for_recipe
		# params.require(:recipe).permit(:title, :description, :user_id)
		params.require(:recipe).permit(:title, :description,:user_id, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy])
	end

end
