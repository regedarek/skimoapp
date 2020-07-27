class CreateReferee
  include Import["repositories.users_repository", "repositories.referees_repository"]
  include Dry::Monads[:result]


  CreateRefereeSchema = Dry::Schema.Params do
    required(:referee).hash do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      optional(:phone).maybe(:string)
      optional(:number).maybe(:string)
      required(:email).filled(:string)
      optional(:organization).maybe(:string)
      required(:expiration_date).filled(:string)
    end
  end

  def call(raw_params)
    form_outputs = CreateRefereeSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    user = users_repository.find_or_create(
      form_outputs[:referee].except!(
        :number, :organization, :expiration_date
      ).merge(password: 'test12')
    )
    referees_repository.create(
      form_outputs[:referee].except!(
        :first_name, :last_name, :phone, :email
      ).merge(user_id: user.id)
    )

    Success(:success)
  end
end
