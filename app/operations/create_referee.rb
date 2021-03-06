class CreateReferee
  include Import["repositories.users_repository", "repositories.referees_repository", "repositories.organizations_repository"]
  include Dry::Monads[:result]

  CreateRefereeSchema = Dry::Schema.Params do
    required(:referee).hash do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      optional(:phone).maybe(:string)
      optional(:number).maybe(:string)
      optional(:email).maybe(:string)
      optional(:organization).maybe(:string)
      optional(:expiration_date).maybe(:string)
    end
  end

  def call(raw_params)
    form_outputs = CreateRefereeSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    if form_outputs[:email]
      user = users_repository.find_or_create(
        form_outputs[:referee].extract!(
          :first_name, :last_name, :phone, :email
        ).merge(password: 'test12')
      )
      referee = referees_repository.create(
        form_outputs[:referee].extract!(
          :number, :expiration_date
        ).merge(user_id: user.id)
      )
      organizations_repository.assign_to_user(user.id, form_outputs[:referee][:organization])
    else
      referee = referees_repository.create(
        form_outputs[:referee].extract!(
          :number, :expiration_date, :first_name, :last_name, :organization
        )
      )
    end

    Success(:success)
  end
end
