class FrmForum < ActiveRecord::Base
  
  # Associations
  has_many :frm_topics, :dependent => :destroy
  has_many :frm_posts, :through => :frm_topics
  
  belongs_to :frm_category
  
  # Accessors
  attr_accessible :title, :description, :state, :position, :frm_category_id
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
  validates :description, :presence => true
  validates :frm_category_id, :presence => true
end