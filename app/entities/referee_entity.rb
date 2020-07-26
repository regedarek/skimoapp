require 'dry-struct'

module Types
  include Dry.Types()
end

class RefereeEntity < Dry::Struct
  transform_keys(&:to_sym)

  attribute :first_name, Types::String.optional
  attribute :last_name, Types::String.optional
  attribute :email, Types::String.optional
  attribute :phone, Types::String.optional
  attribute :organization, Types::String.optional
  attribute :expiration_date, Types::String.optional
  attribute :number, Types::String.optional
end
