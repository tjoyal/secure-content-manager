namespace :demo do
  desc "Seed some groups and some servers"
  task :seed => :environment do
    5.times do |i|
      Group.create!(:name => "Group ##{i}")
    end

    25.times do |i|
      server_group = Group.all.sample
      server_group.servers.create!(:name => "Server ##{i}")
    end
  end 
end
