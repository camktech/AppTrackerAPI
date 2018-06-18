class Application < ApplicationRecord
  include Skillable

	belongs_to :user
	has_many :interviews
	belongs_to :resume
  has_many :application_skills
  has_many :skills, through: :application_skills, dependent: :destroy

  validates :company_name, :user_id, presence: true

  def required_skills
    self.application_skills.joins(:skill).select("application_skills.id, application_skills.skill_id, application_skills.experience, skills.name")
  end

end
