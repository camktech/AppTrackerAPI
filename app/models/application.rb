class Application < ApplicationRecord
  include Skillable

	belongs_to :user
	has_many :interviews
	belongs_to :resume
  has_many :skills, class_name: 'ApplicationSkill'

end
