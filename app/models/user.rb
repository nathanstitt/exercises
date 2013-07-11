class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_one :user_profile, :dependent => :destroy
  has_one :default_list, :through => :user_profile
  has_one :deputy_user_group, :through => :user_profile
  has_many :deputies, :class_name => 'User', :through => :deputy_user_group

  has_many :user_group_users, :dependent => :destroy
  has_many :user_groups, :through => :user_group_users

  has_many :collaborators, :dependent => :destroy
  has_many :collaborables, :through => :collaborators

  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save :force_active_admin
  after_create :create_user_profile

  validates_presence_of :username, :password, :email, :first_name, :last_name
  validates_uniqueness_of :username, :email

  def name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    is_admin
  end

  def is_disabled?
    !disabled_at.nil?
  end

  def disable
    update_attribute(:disabled_at, Time.now)
  end

  ##################
  # Access Control #
  ##################

  def can_be_updated_by?(user)
    false
  end

  def can_be_destroyed_by?(user)
    can_be_updated_by?(user)
  end

  protected

  #############
  # Callbacks #
  #############

  def create_user_profile
    up = UserProfile.new
    up.user = self
    up.save
  end

  def force_active_admin
    if self == User.first
      self.is_admin = true
      self.disabled_at = nil
    end
  end
end
