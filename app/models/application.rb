class Application < ApplicationRecord
  include Skillable

	belongs_to :user
	has_many :interviews
	belongs_to :resume
  has_many :application_skills
  has_many :skills, through: :application_skills, dependent: :destroy

  validates :company_name, :user_id, presence: true

end
