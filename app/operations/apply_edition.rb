class ApplyEdition
  include Import["repositories.editions_repository"]
  include Dry::Monads[:result]

  ApplyEditionSchema = Dry::Schema.Params do
    required(:edition_apply).hash do
      required(:name).filled(:string)
      required(:description).filled(:string)
      required(:start_date).filled(:string)
    end
  end

  def call(raw_params)
    form_outputs = ApplyEditionSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash[:edition_apply].extract!(:name, :description, :start_date), form_outputs.errors]) if form_outputs.failure?

    apply = editions_repository.apply(
      form_outputs[:edition_apply].extract!(:name, :description, :start_date)
    )

    Success(:success)
  end
end
