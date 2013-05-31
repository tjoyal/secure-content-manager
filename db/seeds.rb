
user = User.new(
    :email                 => "test@exemple.com",
    :password              => "testtest",
    :password_confirmation => "testtest",
    :admin                 => true,
)
user.save!

user = User.new(
    :email                 => "test2@exemple.com",
    :password              => "testtest",
    :password_confirmation => "testtest",
    :admin                 => false,
)
user.save!
