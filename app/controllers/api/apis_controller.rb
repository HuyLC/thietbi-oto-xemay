# frozen_string_literal: true

class Api::ApisController < ActionController::API
  before_action :pagination, :order_by

  def pagination
    @page_number = params[:page].to_i.zero? ? 1 : params[:page]
    @page_size = params[:size].to_i.zero? ? 12 : params[:size]
  end

  def order_by
    @column = params[:field]
    @sort_type = %w[desc asc].include?(params[:sort_type]) ? params[:sort_type] : 'asc'
  end

  def render_model_not_found(model)
    render json: {
      message: "#{model} not found"
    }, status: :not_found
  end
end
