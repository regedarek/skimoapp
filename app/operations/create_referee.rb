class CreateReferee
  include Import["repositories.referees_repository"]
  include Dry::Monads[:result]

  def call(raw_inputs)
    #referees_repository.create(raw_inputs)
    Failure.new([:not_found, :reasons])
  end
end
