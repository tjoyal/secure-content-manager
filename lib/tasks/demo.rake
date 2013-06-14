namespace :demo do
  desc "Seed some groups and some servers"
  task :seed => :environment do
    4.times do |i|
      group = Group.create!(:name => "Group ##{i+1}")
    end

    25.times do |i|
      server_group = Group.all.sample
      server_group.servers.create!(:name => "Server ##{i+1}")
    end


    user = User.create!(
        :email                 => "test2@example.com",
        :password              => "testtest",
        :password_confirmation => "testtest",
        :admin                 => false,
    )

    user.user_groups.create!(
        :group_id => 1,
        :read     => true,
        :edit     => true,
        :manage   => true
    )

    user.user_groups.create!(
        :group_id => 2,
        :read     => true,
        :edit     => true,
        :manage   => false
    )

    user.user_groups.create!(
        :group_id => 3,
        :read     => true,
        :edit     => false,
        :manage   => false
    )
  end 
end
