require 'dry/monads'
require "dry/matcher/result_matcher"

class RefereesController < ApplicationController
  include Import["operations.create_referee", "operations.update_referee"]
  include Dry::Monads[:result]

  def index
    authorize! :create, Referee

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
    authorize! :create, Referee

    Dry::Matcher::ResultMatcher.(create_referee.call(params)) do |m|
      m.success do |v|
        redirect_to referees_path, notice: 'Udało się'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, params, errors|
        @referee = RefereeEntity.new(params[:referee])
        render :new
      end
    end
  end

  def edit
    authorize! :manage, Referee
    @referee = Referee.find(params[:id])
  end

  def update
    authorize! :manage, Referee
    Dry::Matcher::ResultMatcher.(update_referee.call(params)) do |m|
      m.success do |v|
        redirect_to referees_path, notice: 'Udało się'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, params, errors|
        @referee = Referee.find(params[:id])
        render :edit
      end
    end
  end
end
