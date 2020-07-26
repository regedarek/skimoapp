require 'dry/monads'
require "dry/matcher/result_matcher"

class RefereesController < ApplicationController
  include Import["operations.create_referee"]
  include Dry::Monads[:result]

  def index
    @referees = Referee.all
  end

  def new
    @referee = RefereeEntity.new(
      first_name: '',
      last_name: '',
      email: '',
      phone: '',
      number: '',
      organization: '',
      expiration_date: ''
    )
  end

  def create
    test = Dry::Matcher::ResultMatcher.(create_referee.call(params)) do |m|
      m.success do |v|
        "Yay: #{v}"
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, errors|
        "Cannot be done: #{errors.inspect}"
      end
    end
  end
end
