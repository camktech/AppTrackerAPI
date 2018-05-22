module Skillable
  # create job to auto increment years of exp every some peirod of time
  def add_skills(skills)
    new_skills = []
    current_skills = self.skills.to_a
    [skills].each do |skill|
      new_skills << "#{self.class.name}Skill".constantize.create(application_id: id, skill_id: skill.id) if current_skills.empty?
    end
    self.skills << new_skills
  end

  def remove_skills(skills)
    current_skills = self.skills.to_a
    [skills].each do |skill|
      current_skills.reject!{|application_skill| application_skill.skill_id == skill.id}
    end
    self.skills = current_skills
  end
end
