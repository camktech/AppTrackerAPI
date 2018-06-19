require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'calculate_user_skill_match' do
    # before :each do
    #   ['a', 'b', 'c', 'd', 'e', 'f'].each do |name|
    #     Skill.create(name: name)
    #   end
      
    #   user.create(first_name: 'cam', last_name: 'kilner', email: 'cam@cam.com', password: '12123123123')
    #   user.applications.create(company_name: "Company Name")
    #   user.user_skills.create(Skill)
    # end

    it 'return percentage match when user and application have skills' do
      # app = Application.first
      # app_skills = app.application_skills
      # user_skills = User.find(app.user_id).user_skills
      app_skills = {
        a:1,
        b:2,
        c:3,
        d:2
      }
      user_skills = {
        a:1,
        c:3
      }
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(50)

    end

    it 'return precentage match when application has a single skill' do
      app_skills = {
        a:1
      }
      user_skills = {
        a:1,
        c:3
      }
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(100)
    end

    it 'return precentage match when user has a single skill' do
      app_skills = {
        a:3,
        b:2,
        c:5
      }
      user_skills = {
        a:2
      }
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(20)
    end
    it 'return precentage match when user multiple skills' do
      app_skills = {
        a:3,
        b:2,
        c:5
      }
      user_skills = {
        a:2, b: 1
      }
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(30)
    end

    it 'return -1 as percentage when user has no skills' do
      app_skills = {
        a:1,
        b:2,
        c:3,
        d:2
      }
      user_skills = nil
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(-1)
    end

    it 'should return 101 as percentage when application has no skills' do
      app_skills = nil
      user_skills = {
        a:1,
        c:3
      }
      expect(Application.calculate_user_skill_match(app_skills, user_skills)).to eql(101)
    end
  end
end
