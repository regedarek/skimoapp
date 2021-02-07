class UpdateEdition
  include Import["repositories.editions_repository"]
  include Dry::Monads[:result]

  UpdateEditionSchema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:description).filled(:string)
    optional(:program_file).maybe(:string)
    optional(:start_date).maybe(:string)
    optional(:address).maybe(:string)
    optional(:sign_up_url).maybe(:string)
    optional(:photos).maybe(:array)
    optional(:results).maybe(:string)
    optional(:fb_page).maybe(:string)
    optional(:covid_19).maybe(:string)
    optional(:map_1).maybe(:string)
    optional(:map_2).maybe(:string)
    optional(:season_id).maybe(:integer)
    optional(:map_3).maybe(:string)
    optional(:accomodation).maybe(:string)
    optional(:contact).maybe(:string)
    optional(:organization).maybe(:string)
    optional(:volounteers).maybe(:integer)
    optional(:categories).maybe(:string)
    optional(:technical_restrictions).maybe(:string)
    optional(:program_content).maybe(:string)
    required(:start_date).filled(:date)
  end

  def call(id, raw_params)
    form_outputs = UpdateEditionSchema.call(raw_params.to_unsafe_h)
    return Failure([:invalid, EditionApply.find(id), form_outputs.errors]) if form_outputs.failure?

    b = editions_repository.update(id, form_outputs.to_h)

    Success(b)
  end
end
