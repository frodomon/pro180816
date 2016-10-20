class ProductsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  
  def index
    @product = Product.all
    render layout: false
  end

  def show
    @product = Product.find(params[:id])
    render layout: false
  end

  def new
    @product = Product.new 
    @today = Time.now
    @categories = Category.all
    render layout: false
  end

  def create
    flash[:error] = nil
    product = Product.new(product_parameters)
    if product.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      product.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @product = product
      render :new, layout: false 
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    product = Product.find(params[:id])
    if product.update_attributes(product_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      product.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
       @product = product
      render :edit, layout: false
    end
  end

  def destroy
    product = Product.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el cliente seleccionado."
    render :json => product
  end
  
  private
  def product_parameters
    params.require(:product).permit(:name,:unit_of_measurement, :trademark, :description, :category_id)
  end
end