class User < ApplicationRecord

	has_many :applications
	has_many :resumes
  has_and_belongs_to_many :skills  

end
