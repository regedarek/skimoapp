class UpdateReferee
  include Import["repositories.users_repository", "repositories.referees_repository", "repositories.organizations_repository"]
  include Dry::Monads[:result]

  UpdateRefereeSchema = Dry::Schema.Params do
    required(:referee).hash do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      optional(:phone).maybe(:string)
      optional(:number).maybe(:string)
      optional(:user_id).maybe(:string)
      optional(:email).maybe(:string)
      optional(:organizations).maybe(:string)
      required(:expiration_date).filled(:string)
    end
  end

  def call(raw_params)
    form_outputs = UpdateRefereeSchema.call(raw_params.to_unsafe_h)
    byebug
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    if form_outputs[:user_id]
      referee = referees_repository.update(
        form_outputs[:referee].extract!(
          :user_id
        )
      )
    else
      referee = referees_repository.update(
        form_outputs[:referee].extract!(
          :last_name, :first_name, :organizations
        )
      )
    end

    byebug
    referee = referees_repository.update(
      form_outputs[:referee].extract!(
        :number, :expiration
      )
    )

    Success(:success)
  end
end
