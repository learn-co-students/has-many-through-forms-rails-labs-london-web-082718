class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @posts = Post.all
  end
end
