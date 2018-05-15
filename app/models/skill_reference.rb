class SkillReference < ApplicationRecord
  belongs_to :user
  belongs_to :application
  belongs_to :skill
end
