require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'user validation' do

    before :each do 
      @user = User.create({first_name: 'Jerry', last_name: 'Seinfeld', email: 'js@gmail.com', password: '123123123'})
    end

    it 'is invalid without first_name' do
      @user.first_name = nil
      expect(@user.valid?).to eql(false)
    end

    it 'is invalid without last_name' do
      @user.last_name = nil
      expect(@user.valid?).to eql(false)
    end

    it 'is invalid without email' do
      @user.email = nil
      expect(@user.valid?).to eql(false)
    end

    it 'is invalid without password' do
      @user.password = nil
      expect(@user.valid?).to eql(false)
    end

    it 'is invalid if email is already in use' do
      @user.save
      new_user = User.new({first_name: 'Jerry', last_name: 'Seinfeld', email: 'js@gmail.com', password: '123123123'})
      expect(new_user.valid?).to eql(false)
    end

    it 'is invalid if password is less than 8 characters' do
      @user.password = '123'
      expect(@user.valid?).to eql(false)
    end
  end

  it 'should return full name with name is called' do
    @user = User.create({first_name: 'Jerry', last_name: 'Seinfeld', email: 'js@gmail.com', password: '123123123'})
    expect(@user.name).to eql("#{@user.first_name} #{@user.last_name}")
  end

  describe 'skills' do

    before :each do 
      @user = User.create({first_name: 'Jerry', last_name: 'Seinfeld', email: 'js@gmail.com', password: '123123123'})
      @skill = Skill.create(name: 'test_skill')
      @user.user_skills.create(skill_id: @skill.id)
    end



  end
end
