class OrganizationsRepository
  def add_to_user(user_id, name)
    User.find(user_id).organizations.create(name: name)
  end
end
