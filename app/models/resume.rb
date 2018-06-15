class Resume < ApplicationRecord
	belongs_to :user
	has_many :applications

  validates :file_name, :user_id, presence: true
end
