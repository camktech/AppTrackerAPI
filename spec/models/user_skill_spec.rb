require 'rails_helper'

RSpec.describe UserSkill, type: :model do

  describe 'validation' do
    before :each do
      @user = User.create({first_name: 'Jerry', last_name: 'Seinfeld', email: 'js@gmail.com', password: '123123123'})
      @skill = Skill.create(name: 'test_skill')
      @user_skill = UserSkill.new(skill_id: @skill.id, user_id: @user.id)
    end

    it 'is invalid without a skill_id' do
      @user_skill.skill_id = nil
      expect(@user_skill.valid?).to eql(false)
    end

    it 'is invalid without a user_id' do
      @user_skill.user_id = nil
      expect(@user_skill.valid?).to eql(false)
    end
  end

end
