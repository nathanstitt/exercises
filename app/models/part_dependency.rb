class PartDependency < ActiveRecord::Base

  sortable

  belongs_to :parent_part, class_name: 'Part'
  belongs_to :dependent_part, class_name: 'Part'

  validates :parent_part, presence: true
  validates :dependent_part, presence: true, uniqueness: { scope: :parent_part_id }

  validate :same_exercise

  delegate_access_control_to :dependent_part

  protected

  def same_exercise
    return if parent_part.exercise_id == dependent_part.exercise_id
    error.add(:base, 'must refer to a single exercise')
    false
  end

end
