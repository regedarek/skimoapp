require 'dry/monads'
require "dry/matcher/result_matcher"

class EditionAppliesController < ApplicationController
  include Import["operations.apply_edition", "operations.update_edition"]
  include Dry::Monads[:result]

  def index
    @edition_applies = EditionApply.order(created_at: :asc)
  end

  def new
    @edition_apply = EditionApply.new
  end

  def create
    Dry::Matcher::ResultMatcher.(apply_edition.call(edition_params)) do |m|
      m.success do |v|
        redirect_to root_path, notice: 'Dziękujemy za zgłoszenie!'
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
    @apply = EditionApply.find(params[:id])
  end

  def edit
    @edition_apply = EditionApply.find(params[:id])
  end

  def update
    Dry::Matcher::ResultMatcher.(update_edition.call(params[:id], edition_params)) do |m|
      m.success do |v|
        redirect_to edit_edition_apply_path(params[:id]), notice: 'Zaktualizowano'
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
      :name, :program_file, :start_date, :description,
      :address, :map_1, :map_2, :map_3, :categories, :technical_restrictions,
      :accomodation, :contact, :organization, :volounteers, :terms, :program_content
    )
  end
end
