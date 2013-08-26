class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :audience
      t.string :behavior
      t.string :step
      t.integer :user_id
      t.string :sme

      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
  end
end
