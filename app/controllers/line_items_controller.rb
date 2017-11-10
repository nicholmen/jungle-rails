class LineItemsController < ApplicationController
  def show
    @line_items = LineItem.find(params[:id])
  end

  def index
    @line_items = LineItem.all.order(created_at: :desc)
  end

end
