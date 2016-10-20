class ProductsLotsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]

  def index
    @products_lot =  ProductsLot.select("product_id, sum(quantity) as quantity").group("product_id")
    render layout: false
  end

  def show
    @products_lot = ProductsLot.find(params[:id])
    render layout: false
  end

  def new
    @products_lot = ProductsLot.new
    @products = Product.all
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    products_lot = ProductsLot.new(products_lot_params)
    if products_lot.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      products_lot.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @products_lot = products_lot
      render :new, layout: false 
    end
  end

  def edit
    @products_lot = ProductsLot.find(params[:id])
    @products = Product.all
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    products_lot = ProductsLot.find(params[:id])
    if products_lot.update_attributes(products_lot_params)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      products_lot.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
       @products_lot = products_lot
      render :edit, layout: false
    end
  end

  def destroy
    products_lot = ProductsLot.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el lote seleccionado."
    render :json => products_lot
  end
  
  def due_front
    render(partial: 'due_front', :layout => false)
  end

  def due_method
    limit_date = params[:end_date]
    @products_lots = ProductsLot.where("due_date <= ?",limit_date)
    render(partial: 'report_due_table', :layout => false)
  end

  def lote_front
    @products = Product.all
    render(partial: 'lote_front', :layout => false)
  end
  def lote_by_product
    product_id = params[:product_id]
    @products_lots = ProductsLot.where("product_id = ? and quantity > 0",product_id)
    render(partial: 'lote_by_product', :layout => false)
  end
  def lote_method
    product_id = params[:product_id]
    @products_lots = ProductsLot.where("product_id = ?",product_id)
    render(partial: 'report_lote_table', :layout => false)
  end
  def empty_lots
    product_id = params[:product_id]
    @products_lots = ProductsLot.where("product_id = ? and quantity = 0",product_id)
    render(partial: 'lote_by_product', :layout => false)
  end

  private
    def products_lot_params
      params.require(:products_lot).permit(:quantity, :sanitary_registry, :due_date, :lot_number, :production_date, :product_id)
    end
end
