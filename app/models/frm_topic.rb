class FrmTopic < ActiveRecord::Base
  
  # Associations
  has_many :frm_posts, :dependent => :destroy
  belongs_to :frm_forum, :counter_cache => true
  belongs_to :user, :class_name => "User", :counter_cache => true
  
  # Accessors
  attr_accessor :body
  attr_accessible :title, :body, :sticky, :locked
  
  # Validations
  validates :title,   :presence => true
  validates :body,    :presence => true, :on => :create
  validates :frm_posts,   :presence => true, :allow_nil => false, :on => :update
  validates :user,    :presence => true
  
  # Scopes
  default_scope :order => 'sticky DESC, updated_at DESC'
  
  # Callbacks
  after_create :create_initial_post
  
  # Methods
  def hit!
    self.class.increment_counter :hits, id
  end
  
  private
    def create_initial_post
      self.frm_posts.build(:body => self.body).tap do |post|
        post.frm_forum = self.frm_forum
        post.user = self.user
        post.save
      end
    end
end
