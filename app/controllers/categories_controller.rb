class CategoriesController < ApplicationController
  before_filter :load_category, :load_path
  
  $categories = []
  
  def show
    @title = "Каталог / #{@category.name}"
    @products = @category.products.published.page(params[:page]).per(30)
    # if @products.size == 0
    #   page, per_page = 1, 1
    #   @products = Array.new
    #   @allcat = find_all_cat(@category)
    #   @allcat.each do |cat|
    #     for i in (0..cat.products.size-1)
    #       @products << cat.products[i]
    #     end
    #   end
    # end
  end
  
  private
    
    def find_all_cat(category)
      if category.children.size > 0
        category.children.each do |subcat|
          $categories << subcat
          if subcat.children.size > 0
            find_all_cat(subcat)
          end
        end
      end
    end
    
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