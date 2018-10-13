# frozen_string_literal: true

class Api::V1::ProductsController < Api::ApisController
  before_action :set_product_by_params, only: %i[show related]
  def show
    render json: @product
  end

  def search
    products = Product.search_for(params[:s])
                      .page(@page_number || 1)
                      .per(@page_size || 12)
                      .order_by(@column || 'title', @sort_type)
    render json: products, meta: {
      pagination: {
        total_objects: Product.search_for(params[:s]).count,
        per_page: @page_size || 12,
        total_pages: products.total_pages,
        current_page: products.current_page
      }
    }, status: :ok
  end

  def related
    products = @product.related
    render json: products
  end

  private

  def set_product_by_params
    @product = Product.friendly.find(params[:id])
    render_model_not_found('Product') if @product.nil?
  end
end
