require 'dry/monads'
require "dry/matcher/result_matcher"

class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end
end
