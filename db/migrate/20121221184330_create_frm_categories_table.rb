class CreateFrmCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :frm_categories, :force => true do |t|
      t.string   :title
      t.boolean  :state, :default => true
      t.integer  :position, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :frm_categories
  end
end
