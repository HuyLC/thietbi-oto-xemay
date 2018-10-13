# frozen_string_literal: true

class Api::V1::CategoriesController < Api::ApisController
  before_action :set_category_by_params, only: %i[products]
  def index
    render json: Category.asc
  end

  def products
    products = @category.products
                        .page(@page_number || 1)
                        .per(@page_size || 18)
                        .order_by(@column || 'name', @sort_type)
    render json: products, meta: {
      pagination: {
        total_objects: @category.products.count,
        per_page: @page_size || 12,
        total_pages: products.total_pages,
        current_page: products.current_page
      }
    }, status: :ok
  end

  private

  def set_category_by_params
    @category = Category.friendly.find(params[:id])
    render_model_not_found('Category') if @category.nil?
  end
end
