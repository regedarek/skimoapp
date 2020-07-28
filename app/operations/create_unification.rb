class CreateUnification
  include Import["repositories.unifications_repository"]
  include Dry::Monads[:result]

  CreateUnificationSchema = Dry::Schema.Params do
    required(:unification).hash do
      required(:name).filled(:string)
      required(:description).filled(:string)
      optional(:exact_date).maybe(:string)
    end
  end

  def call(raw_params)
    form_outputs = CreateUnificationSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    referee = unifications_repository.create(
      form_outputs[:unification]
    )

    Success(:success)
  end
end
