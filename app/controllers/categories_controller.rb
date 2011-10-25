class CategoriesController < ApplicationController
  before_filter :load_category
  
  def show
    @products = @category.products.published.page(params[:page]).per(30)
    @title = "Каталог / #{@category.name}"      
  end
  
  private
    
    def load_category
      begin
        @categories = Category.all
        @category = Category.find(params[:id])        
      rescue ActiveRecord::RecordNotFound
        redirect_to products_path, :alert => "Категория не найдена"        
      end
    end
    
end
