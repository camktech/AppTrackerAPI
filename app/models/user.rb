class User < ApplicationRecord
  include Skillable

	has_many :applications
	has_many :resumes
  has_many :interviews
  has_many :user_skills
  has_many :skills, through: :user_skills, dependent: :destroy
  accepts_nested_attributes_for :user_skills

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

end
