ActiveAdmin.register New do
  menu :priority => 1, :label => "Новости"
  
  index do
    column :id
    column "Название", :title
    column "Дата добавления", :created_at
    column "Дата обновления", :updated_at
    default_actions
  end
  
  form do |f|
    f.inputs "Детали:" do
      f.input :title, :label => "Название: "
      f.input :created_at, :label => "Дата добавления:"
    end
    f.inputs "Основная информация:" do
      f.input :body, :label => "Текст: "
    end
    f.buttons
  end
end
