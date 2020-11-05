require 'dry/monads'
require "dry/matcher/result_matcher"

class EditionAppliesController < ApplicationController
  include Import["operations.apply_edition", "operations.update_edition"]
  include Dry::Monads[:result]

  def index
    authorize! :read, EditionApply

    @edition_applies = EditionApply.order(start_date: :asc)
  end

  def new
    authorize! :create, EditionApply

    @edition_apply = EditionApply.new
  end

  def create
    authorize! :create, EditionApply

    Dry::Matcher::ResultMatcher.(apply_edition.call(edition_params)) do |m|
      m.success do |v|
        redirect_to season_edition_applies_path(year: 2021), notice: 'Dziękujemy za zgłoszenie!'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, apply|
        @edition_apply = apply
        render :new
      end
    end
  end

  def show
    @apply = EditionApply.friendly.find(params[:id])
  end

  def edit
    authorize! :manage, EditionApply

    @edition_apply = EditionApply.friendly.find(params[:id])
  end

  def update
    authorize! :manage, EditionApply

    Dry::Matcher::ResultMatcher.(update_edition.call(params[:id], edition_params)) do |m|
      m.success do |apply|
        redirect_to edit_season_edition_apply_path(year: 2021, id: apply.id), notice: 'Zaktualizowano'
      end

      m.failure(:not_found) do
        "No such thing"
      end

      m.failure(:invalid) do |_code, apply|
        @edition_apply = apply
        render :edit
      end
    end
  end

  def edition_params
    params.require(:edition_apply).permit(
      :name, :program_file, :start_date, :description, :season_id,
      :address, :map_1, :map_2, :map_3, :categories, :technical_restrictions,
      :accomodation, :contact, :organization, :volounteers, :terms, :program_content
    )
  end
end
