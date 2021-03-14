require 'dry-struct'

Dry::Types.load_extensions(:maybe)
module Types
  include Dry.Types()
end



class RefereeEntity < Dry::Struct
  transform_keys(&:to_sym)

  attribute :first_name, Types::String.optional
  attribute :last_name, Types::String.optional
  attribute :user_id, Types::Coercible::Integer.optional
  attribute :email, Types::String.optional
  attribute :phone, Types::String.optional
  attribute :organizations, Types::String.optional
  attribute :expiration, Types::Params::Date.optional
  attribute :number, Types::Coercible::Integer.optional | Types::String.optional

  def user?
    user_id.present?
  end
end
