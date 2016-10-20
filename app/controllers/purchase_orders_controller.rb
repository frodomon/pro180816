class PurchaseOrdersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @purchase_orders = PurchaseOrder.all
    render layout: false
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
    render layout: false
  end

  def new
    @purchase_order = PurchaseOrder.new
    @articles = Article.all
    @suppliers = Supplier.all
    @today = Time.now.to_date
    render layout: false
  end

  def create
    flash[:error] = nil
    purchase_order = PurchaseOrder.new(purchase_order_parameters)
    if purchase_order.save
      purchase_order.purchase_order_details.each do |pod|
        article = Article.find(pod.article_id)
        article.stock = article.stock + pod.quantity
        article.save
      end
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      purchase_order.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @purchase_order = purchase_order
      render :new, layout: false 
    end
  end

  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
    @articles = Article.all
    @suppliers = Supplier.all
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    purchase_order = PurchaseOrder.find(params[:id])
    if purchase_order.update_attributes(purchase_order_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      purchase_order.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @purchase_order = purchase_order
      render :edit, layout: false
    end
  end

  def destroy
    purchase_order = PurchaseOrder.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el contrato seleccionado."
    render :json => purchase_order
  end

  def add_item
    @reg_n = ((Time.now.to_f)*100).to_i
    @article = Article.find(params[:article_id])
    render(partial: 'items', :layout => false)
  end

  def add_document
    @reg_n = ((Time.now.to_f)*100).to_i
    render(partial: 'items2', :layout => false)
  end

  private
  def purchase_order_parameters
    params.require(:purchase_order).permit(:supplier_id, :code, :date_of_issue, :billing_address, :delivery_address, :order_date, :delivery_date,
      purchase_order_details_attributes: [:article_id,:quantity,:unit_price,:total_price,:due_date,:production_date,:lote,:_destroy],
      purchase_order_documents_attributes: [:document,:_destroy])
  end
end