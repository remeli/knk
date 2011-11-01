class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :key
      t.string :value
      t.references :fieldable, :polymorphic => true
      t.timestamps
    end
  end
end