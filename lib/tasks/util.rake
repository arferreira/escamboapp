namespace :util do
  desc "Create admins fakes for app"
  task generate_admins: :environment do
    2.times do
      user1 = Admin.new email: "admin2@admin.com", name: "Mariana", password: "123456", password_confirmation: "123456", role: 1
      user2 = Admin.new email: "admin3@admin.com", name: "Luis", password: "123456", password_confirmation: "123456", role: 1
      if user1.save && user2.save
        puts "Admins created with success"
      end
    end
  end

end
