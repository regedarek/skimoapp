class CreateUnification
  include Import["repositories.unifications_repository"]
  include Dry::Monads[:result]

  CreateUnificationSchema = Dry::Schema.Params do
    required(:unification).hash do
      required(:name).filled(:string)
      required(:description).filled(:string)
      required(:exact_date).filled(:string)
      required(:referees).array(:integer)
    end
  end

  def call(raw_params)
    form_outputs = CreateUnificationSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    unification = unifications_repository.create(
      form_outputs[:unification].extract!(:name, :description, :exact_date)
    )
    form_outputs[:unification][:referees].each do |referee_id|
      unification.referee_unifications.create referee_id: referee_id
      Referee.find(referee_id).update expiration_date: unification.exact_date
    end

    Success(:success)
  end
end
