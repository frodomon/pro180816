class BusinessesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @business = Business.all
    render layout: false
  end

  def show
    @business = Business.find(params[:id])
    render layout: false
  end

  def new
    @business = Business.new
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    business = Business.new(business_params)
    if business.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      business.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @business = business
      render :new, layout: false 
    end
  end

  def edit
    @business = Business.find(params[:id])
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    business = Business.find(params[:id])
    if business.update_attributes(business_params)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      business.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @business = business
      render :edit, layout: false
    end
  end

  def destroy
    business = Business.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente la empresa seleccionada."
    render :json => business
  end

  private
    def business_params
      params.require(:business).permit(:name, :ruc, :address, :phone, :contact)
    end
end
