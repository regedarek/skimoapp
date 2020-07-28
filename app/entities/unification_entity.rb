require 'dry-struct'

module Types
  include Dry.Types()
end

class UnificationEntity < Dry::Struct
  transform_keys(&:to_sym)

  attribute :name, Types::String.optional.default(nil)
  attribute :description, Types::String.optional.default(nil)
  attribute :exact_date, Types::String.optional.default(nil)
  attribute :referees, Types::Strict::Array.of(Types::String.optional.default(nil))

  def to_key
    nil
  end

  def model_name
    ActiveModel::Name.new(Unification)
  end
end
