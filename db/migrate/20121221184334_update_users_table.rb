class UpdateUsersTable < ActiveRecord::Migration
  def self.up
    add_column :users, :frm_topics_count, :integer, :default => 0
    add_column :users, :frm_posts_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :frm_topics_count
    remove_column :users, :frm_posts_count
  end
end
