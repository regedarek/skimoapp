class UsersRepository
  def create(user_attrs)
    User.create(user_attrs)
  end
end
