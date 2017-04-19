# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Course.delete_all
Enrollment.delete_all
EnrollmentTa.delete_all
# create fake users
# 1st user
User.create(id: 1, first_name: "Nick", last_name: "April", username: "nick", email: "nick@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 2nd user
User.create(id: 2, first_name: "Adi", last_name: "Berkowitz", username: "adi", email: "adi@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 3rd user
User.create(id: 3, first_name: "Hao", last_name: "Wang", username: "hao", email: "haowang@brandeis.edu", university_id: 1, password:"foobar", password_confirmation: "foobar")
# 4th user
User.create(id: 4, first_name: "Stacy", last_name: "Dean", username: "stacy", email: "stacydean@tuffs.edu", university_id: 2, password:"foobar", password_confirmation: "foobar")
# 5th user
User.create(id: 5, first_name: "Fanny", last_name: "Ferguson", username: "fanny", email: "fannyferguson@bc.edu", university_id: 3, password:"foobar", password_confirmation: "foobar")
# create fake courses
arr = ["Capstone Project", "Data Structure", "Mobile App", "Macroeconomics", "Algebra"]
arr2 = ["Pito Salas", "	Antonella Di Lillo", "James Storer", "	Melissa Nemon", "Frank Lowenstein"]
count = 1
major_id = 1
arr.each do |course|
	if count >=4
		major_id +=1
	end
	Course.create(id: count, name: course, major_id: major_id)	#teacher: arr2[count],
	count+=1
end
# # 1st course
# Course.create(id: 1, name: "Capstone Project", major_id:1)
# # 2nd course
# Course.create(id: 2, name: "Data Structure", major_id:1)
# # 3rd course
# Course.create(id: 3, name: "Mobile App", major_id:1)
# # 4th course
# Course.create(id: 4, name: "Macroeconomics", major_id:2)
# # 5th course
# Course.create(id: 5,name: "Algebra", major_id:3)


# create fake enrollments
# 1st enrollment
Enrollment.create!(user_id: 1, course_id:1)
Enrollment.create!(user_id: 1, course_id:2)
Enrollment.create!(user_id: 3, course_id: 4)
Enrollment.create!(user_id: 3, course_id: 2)
Enrollment.create!(user_id: 2, course_id: 3)
Enrollment.create!(user_id:5, course_id:1)
Enrollment.create!(user_id:5, course_id:5)
# 3rd enrollment
# Enrollment.create(user_id: 1, course_id:4)
# # 4th enrollment
# Enrollment.create(user_id: 2, course_id:1)
# # 5th enrollment
# Enrollment.create(user_id: 2, course_id:2)
# # 6th enrollment
# Enrollment.create(user_id: 2, course_id:5)
# # 7th enrollment
# Enrollment.create(user_id: 3, course_id:2)
# # 8th enrollment
# Enrollment.create(user_id: 3, course_id:3)
# # 9th enrollment
# Enrollment.create(user_id: 4, course_id:2)
# # 10th enrollment
# Enrollment.create(user_id: 4, course_id:5)
# # 11th enrollment
# Enrollment.create(user_id: 5, course_id:3)
# # 12th enrollment
# Enrollment.create(user_id: 5, course_id:4)
EnrollmentTa.create!(user_id: 2, course_id:1)
EnrollmentTa.create!(user_id: 3, course_id:1)
EnrollmentTa.create!(user_id: 2, course_id: 2)
EnrollmentTa.create!(user_id:1, course_id:4)
EnrollmentTa.create!(user_id:1, course_id:5)

Officehour.create!(ta_id: 1, course_id: 4, start:"Mon, 3 Apr 2017 08:30:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: 3, course_id: 1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Mon, 3 Apr 2017 12:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Wed, 5 Apr 2017 03:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 1, course_id: 5, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false)
Officehour.create!(ta_id: 2, course_id: 2, start:"Thu, 6 Apr 2017 05:30:00 PM", end:Time.now, online: false )
Officehour.create!(ta_id:2, course_id:1, start:"Mon, 3 Apr 2017 10:00:00 AM", end:Time.now, online: false)

Appointment.create!(ta_id: 2, student_id:5, course_id: 1, start:Time.now, end: Faker::Date.forward, confirmed: false)
Appointment.create!(ta_id: 1, student_id:3, course_id: 4, start: "Wed, 5 Apr 2017 01:30:00 PM", end: Faker::Date.forward, confirmed: true)
Appointment.create!(ta_id: 3, student_id:1, course_id: 1, start:Time.now, end: Faker::Date.forward, confirmed: false)


Review.create!(ta_id: 2, student_id:3, course_id: 2, review: "3 am happy with 1", score: 3)
Review.create!(ta_id: 1, student_id:5, course_id: 5, review: "2 am happy with 1", score: 4)
Review.create!(ta_id: 1, student_id:3, course_id: 4, review: "4 am happy with 1", score: 5)
# Review.create!(ta_id:3, student_id:1, course_id:1, review:"eh", score:3.5)
