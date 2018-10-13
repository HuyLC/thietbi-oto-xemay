# frozen_string_literal: true

class Api::V1::SubCategoriesController < Api::ApisController
  before_action :set_sub_category_by_params, only: %i[products]

  def products
    products = @sub_category.products
                            .page(@page_number || 1)
                            .per(@page_size || 18)
                            .order_by(@column || 'name', @sort_type)
    render json: products, meta: {
      pagination: {
        total_objects: @sub_category.products.count,
        per_page: @page_size || 12,
        total_pages: products.total_pages,
        current_page: products.current_page
      }
    }, status: :ok
  end

  private

  def set_sub_category_by_params
    @sub_category = SubCategory.friendly.find(params[:id])
    render_model_not_found('SubCategory') if @sub_category.nil?
  end
end
