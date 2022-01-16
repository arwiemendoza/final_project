admin = User.new(first_name: "admin", last_name: "admin", email:"admin@gmail.com", password:"123456", password_confirmation:"123456", admin:true, user_status: "Approved")
admin.skip_confirmation!
admin.save

helper = User.new(first_name: "helper", last_name: "helper", email:"helper@gmail.com", password:"123456", password_confirmation:"123456", helper:true, user_status: "Approved")
helper.skip_confirmation!
helper.save

user = User.new(first_name: "user", last_name: "user", email:"user@gmail.com", password:"123456", password_confirmation:"123456", user_status: "Approved")
user.skip_confirmation!
user.save