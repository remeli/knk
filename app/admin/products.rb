ActiveAdmin.register Product do
  menu :priority => 2, :label => "Каталог"
  
  scope :all_products
  scope :published
  scope :unpublished

  
  index do
    column :id
    column "Название", :name
    column "Описание", :description
    column "Опубликовано", :published, :sortable => :published do |product|
      if product.published?
        div :class => "published_column" do 
          "Опубликовано"
        end
      else
        div :class => "unpublished_column" do 
          "Не опубликовано"
        end
      end
    end
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Детали" do
      f.inputs do
        f.input :category, :label => "Рубрика: *"
      end
      f.input :name, :label => "Название товара: "
      f.input :description, :label => "Описание: "
      f.input :photo, :as => :file, :label => "Фотография:"
      f.input :manufact, :label => "Производитель: "
      f.input :published, :label => "Опубликовано"
    end
    f.buttons
  end
  
end
