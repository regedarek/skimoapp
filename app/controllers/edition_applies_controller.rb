require 'dry/monads'
require "dry/matcher/result_matcher"

class EditionAppliesController < ApplicationController
  include Import["operations.apply_edition"]
  include Dry::Monads[:result]

  def index
    @edition_applies = EditionApply.all
  end

  def new
    @edition_apply = EditionApply.new
  end

  def create
    Dry::Matcher::ResultMatcher.(apply_edition.call(params)) do |m|
      m.success do |v|
        redirect_to edition_applies_path, notice: 'Dziękujemy za zgłoszenie!'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, params, errors|
        @edition_apply = EditionApply.new(params)
        render :new
      end
    end
  end
end
