ActiveAdmin.register Category do
  
  menu :priority => 3, :label => "Рубрики товаров"
  index do
    column :id
    column :name
    default_actions
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :name, :label => "Название категории"
    end
    f.buttons
  end
end
