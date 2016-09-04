class SuppliersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @supplier = Supplier.all
    render layout: false
  end

  def show
    @supplier = Supplier.find(params[:id])
    render layout: false
  end

  def new
    @supplier = Supplier.new 
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    supplier = Supplier.new(supplier_parameters)
    if supplier.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      supplier.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @supplier = supplier
      render :new, layout: false 
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    supplier = Supplier.find(params[:id])
    if supplier.update_attributes(supplier_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      supplier.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @supplier = supplier
      render :edit, layout: false
    end
  end

  def destroy
    supplier = Supplier.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el proveedor seleccionado."
    render :json => supplier
  end

  private
  def supplier_parameters
    params.require(:supplier).permit(:name,:ruc,:address,:phone,:contact)
  end
end