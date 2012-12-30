class CreateFrmPostsTable < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.text     :body
      t.integer  :frm_forum_id
      t.integer  :frm_topic_id
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end