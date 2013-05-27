namespace :demo do
  desc "Seed some groups and some servers"
  task :seed => :environment do
    (2 + rand(3)).times do |i|
      group = Group.create!(:name => "Group ##{i+1}")
    end

    25.times do |i|
      server_group = Group.all.sample
      server_group.servers.create!(:name => "Server ##{i+1}")
    end
  end 
end
