class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.string :repo
      t.integer :user_id

      t.timestamps         
    end    
    add_index :themes, :user_id
  end

  def self.down
    remove_index :themes, :user_id
    drop_table :themes
  end
end
