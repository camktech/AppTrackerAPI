class Skill < ApplicationRecord
  has_many :user_skills
  has_many :application_skills

  validates :name, presence: true
  validates :name, uniqueness: true
end
