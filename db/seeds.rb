
user = User.new(
    :email                 => "test@example.com",
    :password              => "testtest",
    :password_confirmation => "testtest",
    :admin                 => true,
)
user.save!
