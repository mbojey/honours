namespace :db do
  task populate: :environment do
  	User.create!(fname: "Matt", lname: "Bojey", email: "test@test.ca", username: "test", 
  		password: "testtest", password_confirmation: "testtest", lab: "L05",
  		studentnumber: "0")
  end
end