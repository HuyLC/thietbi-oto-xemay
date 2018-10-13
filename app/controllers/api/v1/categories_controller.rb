# frozen_string_literal: true

class Api::V1::CategoriesController < Api::ApisController
  def index
    render json: Category.asc
  end
end
