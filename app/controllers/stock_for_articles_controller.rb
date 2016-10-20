class StockForArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]

  def index
    @product = Product.all
    render layout: false
  end

  def due_front
    render(partial: 'due_front', :layout => false)
  end

  def due_method
    limit_date = params[:end_date]
    @products = Product.where("due_date <= ?",limit_date)
    render(partial: 'report_table', :layout => false)
  end

  def lote_front
    @products = Product.all
    render(partial: 'lote_front', :layout => false)
  end

  def lote_method
    article_id = params[:article_id]
    @products = Product.where("id = ?",article_id)
    render(partial: 'report_lote_table', :layout => false)
  end
end
