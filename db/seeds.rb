
user = User.new(
    :email                 => "test@exemple.com",
    :password              => "testtest",
    :password_confirmation => "testtest"
)
user.save!
