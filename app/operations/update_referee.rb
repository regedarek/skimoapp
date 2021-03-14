class UpdateReferee
  include Import["repositories.users_repository", "repositories.referees_repository", "repositories.organizations_repository"]
  include Dry::Monads[:result]

  UpdateRefereeSchema = Dry::Schema.Params do
    required(:id).filled(:integer)
    required(:referee).hash do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      optional(:phone).maybe(:string)
      optional(:number).maybe(:string)
      optional(:user_id).maybe(:string)
      optional(:email).maybe(:string)
      optional(:organizations).maybe(:string)
      required(:expiration).filled(:string)
    end
  end

  def call(raw_params)
    form_outputs = UpdateRefereeSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    referees_repository.update(
      id: form_outputs[:id],
      attrs: form_outputs[:referee].extract!(:first_name, :last_name, :number),
      expiration_date: form_outputs[:referee][:expiration]
    )

    Success(:success)
  end
end
