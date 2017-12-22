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
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(params_for_recipe)
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
		filtering_params(params).each do |key, value|
    	@recipes = @recipes.public_send(key, value) if value.present?
  		end
	end

private
	
	def params_for_recipe
		params.require(:recipe).permit(:title, :description,:category,:user_id, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy])
	end
	def filtering_params(params)
  		params.slice(:category)
	end

end
