namespace :fake do
  desc "Generate fake messages"
  task :messages => :environment do
    5.times do
      Message.create! text: Faker::Lorem.paragraph
    end
    puts "There are now #{Message.count} messages"
  end
end
