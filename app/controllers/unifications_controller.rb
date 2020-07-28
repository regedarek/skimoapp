require 'dry/monads'
require "dry/matcher/result_matcher"

class UnificationsController < ApplicationController
  include Import["operations.create_unification"]
  include Dry::Monads[:result]

  def index
    @unifications = Unification.all
  end

  def new
    @unification = Unification.new
  end

  def create
    Dry::Matcher::ResultMatcher.(create_unification.call(params)) do |m|
      m.success do |v|
        redirect_to unifications_path, notice: 'Udało się'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, params, errors|
        @unification = Unification.new(params[:unification])
        render :new
      end
    end
  end
end
