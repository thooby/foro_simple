class CreateFrmForumsTable < ActiveRecord::Migration
  def self.up
    create_table :frm_forums, :force => true do |t|
      t.string   :title
      t.text     :description
      t.boolean  :state, :default => true
      t.integer  :frm_topics_count, :default => 0
      t.integer  :frm_posts_count, :default => 0
      t.integer  :position, :default => 0
      t.integer  :frm_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :frm_forums
  end
end
