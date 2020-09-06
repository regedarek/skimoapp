class SkimoContainer
  extend Dry::Container::Mixin

  register "repositories.referees_repository" do
    RefereesRepository.new
  end

  register "repositories.editions_repository" do
    EditionsRepository.new
  end

  register "repositories.users_repository" do
    UsersRepository.new
  end

  register "repositories.organizations_repository" do
    OrganizationsRepository.new
  end

  register "repositories.unifications_repository" do
    UnificationsRepository.new
  end

  register "operations.create_referee" do
    CreateReferee.new
  end

  register "operations.update_referee" do
    UpdateReferee.new
  end

  register "operations.create_unification" do
    CreateUnification.new
  end

  register "operations.apply_edition" do
    ApplyEdition.new
  end
end

Import = Dry::AutoInject(SkimoContainer)
Dry::Schema.load_extensions(:monads)
