class CreateFrmTopicsTable < ActiveRecord::Migration
  def self.up
    create_table :frm_topics, :force => true do |t|
      t.string   :title
      t.integer  :hits, :default => 0
      t.boolean  :sticky, :default => false
      t.boolean  :locked, :default => false
      t.integer  :frm_posts_count
      t.integer  :frm_forum_id
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :frm_topics
  end
end
