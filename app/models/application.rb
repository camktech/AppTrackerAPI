class Application < ApplicationRecord

	belongs_to :user
	has_many :interviews
	belongs_to :resume
  # has_and_belongs_to_many :skills
  # has_many :skills, through: :entity_skills
  has_many :skills, class_name: 'SkillReference'

end
