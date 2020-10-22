class ApplyEdition
  include Import["repositories.editions_repository"]
  include Dry::Monads[:result]

  def call(params)
    apply = EditionApply.new(params)
    return Failure([:invalid, apply]) if apply.invalid?

    apply_record = editions_repository.apply(params)

    Success(:success)
  end
end
