class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  # create job to auto increment years of exp every some peirod of time

  validates :user_id, :skill_id, presence: true

end
