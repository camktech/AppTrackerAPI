class Skill < ApplicationRecord
  # has_and_belongs_to_many :applications
  has_many :skill_references
end
