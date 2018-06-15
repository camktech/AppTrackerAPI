class ApplicationSkill < ApplicationRecord
  belongs_to :application
  belongs_to :skill

  validates :application_id, :skill_id, presence: true
end
