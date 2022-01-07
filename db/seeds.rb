admin = User.new(first_name: "admin", last_name: "admin", email:"admin@gmail.com", password:"123456", password_confirmation:"123456", admin:true, user_status: "Approved")
admin.save

helper = User.new(first_name: "admin", last_name: "admin", email:"helper@gmail.com", password:"123456", password_confirmation:"123456", helper:true, user_status: "Approved")
helper.save

user = User.new(first_name: "admin", last_name: "admin", email:"user@gmail.com", password:"123456", password_confirmation:"123456", user_status: "Approved")
user.save