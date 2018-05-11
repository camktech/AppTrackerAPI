# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: 'cam', last_name: 'kilner', email: 'ck@gmail.com', password: 'change123')

user = User.first
resume_1 = user.resumes.create(file_name: 'ck.pdf')
user.applications.create(company_name: 'example_company_name', position: 'web developer', resume:)



ERROR
2.4.1 :012 > Application.first.resume.create
  Application Load (0.2ms)  SELECT  "applications".* FROM "applications" ORDER BY "applications"."id" ASC LIMIT ?  [["LIMIT", 1]]
  Resume Load (0.2ms)  SELECT  "resumes".* FROM "resumes" WHERE "resumes"."application_id" = ? LIMIT ?  [["application_id", 1], ["LIMIT", 1]]
NoMethodError: undefined method `create' for nil:NilClass
  from (irb):12
2.4.1 :013 > Application.first.resume