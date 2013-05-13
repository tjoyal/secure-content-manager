
user = User.new(
    :email                 => "test@exemple.com",
    :password              => "testtest",
    :password_confirmation => "testtest"
)
user.save!


5.times do |i|
  Group.create!(:name => "Group ##{i}")
end

25.times do |i|
  server_group = Group.all.sample
  server_group.servers.create!(:name => "Server ##{i}")
end
