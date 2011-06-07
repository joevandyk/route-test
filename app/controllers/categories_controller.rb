class CategoriesController < ApplicationController
  def index
    @category = Category.find_by_name(params[:category_name])
    render :text => "Category found! name is #{ @category.name }.  Subcategory name is #{ params[:subcategory_name] }"
  end
end
