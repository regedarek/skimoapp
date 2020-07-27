class UsersRepository
  def create(user_attrs)
    User.create(user_attrs)
  end

  def find_or_create(user_attrs)
    if User.exists?(email: user_attrs[:email])
      User.find_by(email: user_attrs[:email])
    else
      User.create(user_attrs)
    end
  end
end
