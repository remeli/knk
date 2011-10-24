class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufact
      t.text :description
      t.boolean :published, :default => true
      t.integer :category_id
      t.timestamps
    end
  end
end
