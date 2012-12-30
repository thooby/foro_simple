class User < ActiveRecord::Base
has_many :frm_topics, :dependent => :destroy
has_many :frm_posts, :dependent => :destroy
end
