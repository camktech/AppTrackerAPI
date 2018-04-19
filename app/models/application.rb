class Application < ApplicationRecord

	belongs_to :user
	has_many :interviews
	has_one :resume
  has_and_belongs_to_many :skills

end
