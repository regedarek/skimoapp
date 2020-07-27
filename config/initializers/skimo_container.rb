class SkimoContainer
  extend Dry::Container::Mixin

  register "repositories.referees_repository" do
    RefereesRepository.new
  end

  register "repositories.users_repository" do
    UsersRepository.new
  end

  register "operations.create_referee" do
    CreateReferee.new
  end
end

Import = Dry::AutoInject(SkimoContainer)
Dry::Schema.load_extensions(:monads)
