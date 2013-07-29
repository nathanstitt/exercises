class UserGroup < ActiveRecord::Base
  belongs_to :container, :polymorphic => true

  has_many :user_group_users, :dependent => :delete_all, :inverse_of => :user_group
  has_many :users, :through => :user_group_users

  accepts_nested_attributes_for :user_group_users, :allow_destroy => true

  attr_accessible :name, :user_group_users_attributes

  validates_presence_of :name

  def full_name
    container.nil? ? name : "#{name.capitalize} of #{container.name}"
  end

  def has_user?(user)
    return false if user.nil?
    !user_group_users.where(:user_id => user.id).first.nil?
  end

  def has_manager?(user)
    return false if (user.nil? || !container.nil?)
    !user_group_users.managers.where(:user_id => user.id).first.nil?
  end
  
  def add_user(user, manager = false)
    return false if (user.nil? || has_user?(user))
    ugu = UserGroupUser.new(:is_manager => (container.nil? && manager))
    ugu.user_group = self
    ugu.user = user
    ugu.save!
    ugu
  end

  def remove_user(user)
    return false if user.nil?
    ugu = user_group_users.where(:user_id => user.id).first
    return false if ugu.nil?
    ugu.destroy
  end

  def user_group_checks
    unless container.nil?
      return container.user_group_checks if container.respond_to?(:user_group_checks)
      return
    end

    return destroy if user_group_users.empty?

    user_group_users.first.update_attribute(:is_manager, true) if user_group_users.managers.first.nil?
  end

  ##################
  # Access Control #
  ##################

  def can_be_read_by?(user)
    has_user?(user)
  end
    
  def can_be_created_by?(user)
    !user.nil?
  end
  
  def can_be_updated_by?(user)
    has_manager?(user)
  end

  def can_be_destroyed_by?(user)
    user.is_admin?
  end
end
