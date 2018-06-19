class Application < ApplicationRecord
  require 'pry'

	belongs_to :user
	has_many :interviews
	belongs_to :resume
  has_many :application_skills
  has_many :skills, through: :application_skills, dependent: :destroy
  accepts_nested_attributes_for :application_skills
  before_save :check_skills_changed
  after_commit :calculate_user_skill_match, if: @should_calculate_skills

  validates :company_name, :user_id, presence: true

  def required_skills
    self.application_skills.joins(:skill).select("application_skills.id, application_skills.skill_id, application_skills.experience, skills.name")
  end

private

  def check_skills_changed
    @should_calculate_skills = self.application_skills.any?{|skill| skill.changed?}
  end

  def calculate_user_skill_match
    total_app_years_exp = self.application_skills.pluck(:experience).sum
    user_skills = self.user.user_skills

    if self.application_skills.length < 1 || total_app_years_exp == 0
      self.update_column(:skills_match, 100)
      return
    end

    if user_skills.blank?
      self.update_column(:skills_match, 0)
      return
    end

    app_skill_hash = self.application_skills.inject({}) {|hash, app_skill| hash[app_skill.skill_id.to_s] = app_skill.experience; hash}
    user_skill_hash = user_skills.inject({}) {|hash, user_skill| hash[user_skill.skill_id.to_s] = user_skill.experience; hash}
    matching_user_skills = user_skill_hash.keys.select{|skill_id| app_skill_hash.keys.include? skill_id}
    percent_match = matching_user_skills.inject(0.0) do |match, skill_id|
      skill_numerator = user_skill_hash[skill_id] > app_skill_hash[skill_id] ? app_skill_hash[skill_id] : user_skill_hash[skill_id]
      match += (skill_numerator.to_f / total_app_years_exp.to_f) * 100
      match
    end

    self.update_column(:skills_match, percent_match.to_i)
  end

end
