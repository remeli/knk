ActiveAdmin.register Category do
  
  menu :priority => 3, :label => "Рубрики товаров"
  index do
    column :id
    column :name
    column "Тип категории:", :childrens, :sortable => :childrens do |category|
      if category.parent
        div :class => "children" do
          "Подкатегория"
        end
      else
        div :class => "parent" do
          "Главная категория"
        end
      end
    end
    default_actions
  end
  
  form do |f|
    f.inputs "Детали" do
      f.inputs "Родительская категория" do
       f.collection_select :parent_id, Category.all(:order => "name"), :id, :name, :include_blank => true
      end
      f.inputs "Основная категория:" do
        f.input :name, :label => "Название:"
      end
    end
    f.buttons
  end
end
