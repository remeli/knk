class CategoriesController < ApplicationController
  before_filter :load_category, :load_path
  
  def show
    @products = @category.products.published.page(params[:page]).per(30)
    @title = "Каталог / #{@category.name}"
  end
  
  private
    
    def load_category
      begin
        @main_categories = Category.mains
        @category = Category.find(params[:id])        
      rescue ActiveRecord::RecordNotFound
        redirect_to products_path, :alert => "Категория не найдена"        
      end
    end
    
    def load_path
      @path = []
      @current_category = Category.find(params[:id])
      if @current_category.parent
        @path << @current_category.parent
        for i in (0..8)
          cat = @path[i]
          unless cat.parent_id == nil
            prev = Category.find(cat.parent_id)
            @path << prev
          else
            break
          end
        end  
      end
    end
  
end