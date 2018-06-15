# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

def create_skills
  skills = %w('javascript html css ruby ruby-on-rails python mysql sass nosql react.js')
  skills.each{|s| Skill.create(name: s)}
end

def create_users
  5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    user = User.create(first_name: first_name, last_name: last_name, email: Faker::Internet.email(first_name), password: '123')
    user.resumes.create(file_name: "#{user.name}")
    Skill.all.sample((3..Skill.all.length).to_a.sample).each do |skill|
      user.user_skills.create(skill_id: skill.id)
    end
    create_user_applications(user)
  end
end

def create_user_applications(user)
  [3,4,5].sample.times do
    application = user.applications.create(
      company_name: Faker::Fallout.faction, 
      position: "#{['sr. ', 'jr. ', ''].sample}web developer", 
      date: Faker::Date.backward([1,2,3,4,5].sample)
    )
    application.resume = user.resumes.sample
    application.save
    Skill.all.sample((3..Skill.all.length).to_a.sample).each do |skill|
      application.application_skills.create(skill_id: skill.id)
    end

  end
end

def create_interview(user, application)
  Interview.create(
    user_id: user.id, 
    application_id: application.id, 
    interview_type: Interview::InterviewTypes.constants.sample,
    interviewer: Faker::Name.name,
    date: application.date + 5.days
  )
end

create_skills
create_users
