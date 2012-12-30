class FrmCategory < ActiveRecord::Base
  
  # Associations
  has_many :frm_forums, :dependent => :destroy
  
  # Accessors
  attr_accessible :title, :state, :position, :frm_category_id
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
end