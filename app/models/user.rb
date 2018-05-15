class User < ApplicationRecord

	has_many :applications
	has_many :resumes
  has_many :interviews
  # has_and_belongs_to_many :skills  
  # has_many :skills, through: :entity_skills
  # has_many :skill_references
  has_many :skills, class_name: 'SkillReference'

end
