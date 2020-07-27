class OrganizationsRepository
  def assign_to_user(user_id, name)
    User.find(user_id).organizations.find_or_create_by(name: name)
  end
end
