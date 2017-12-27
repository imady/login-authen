class Admin::CategoriesController < Admin::ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'New Category Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end



  def index
    @categories = Category.all
  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:notice] = 'update successfully'
    redirect_to admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'deleted'
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
