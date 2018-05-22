class User < ApplicationRecord
  include Skillable

	has_many :applications
	has_many :resumes
  has_many :interviews
  has_many :skills, class_name: 'UserSkill'

  def name
    "#{first_name} #{last_name}"
  end

end
