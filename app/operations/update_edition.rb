class UpdateEdition
  include Import["repositories.editions_repository"]
  include Dry::Monads[:result]

  UpdateEditionSchema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:description).filled(:string)
    optional(:accomodation).maybe(:string)
    optional(:contact).maybe(:string)
    optional(:organization).maybe(:string)
    optional(:volounteers).maybe(:integer)
    optional(:categories).maybe(:string)
    optional(:technical_restrictions).maybe(:string)
    required(:start_date).filled(:date)
  end

  def call(id, raw_params)
    form_outputs = UpdateEditionSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, raw_params.to_unsafe_hash, form_outputs.errors]) if form_outputs.failure?

    editions_repository.update(id, form_outputs.to_h)

    Success(:success)
  end
end
