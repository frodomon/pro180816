class DriversController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @driver = Driver.all
    render layout: false
  end

  def show
    @driver = Driver.find(params[:id])
    render layout: false
  end

  def new
    @driver = Driver.new
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    driver = Driver.new(driver_params)
    if driver.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      driver.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @driver = driver
      render :new, layout: false 
    end
  end

  def edit
    @driver = Driver.find(params[:id])
    @action = 'edit'
    render layout: false
  end
  
  def update
    flash[:error] = nil
    driver = Driver.find(params[:id])
    if driver.update_attributes(driver_params)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      driver.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @driver = driver
      render :edit, layout: false
    end
  end

  def destroy
    driver = Driver.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el cliente seleccionado."
    render :json => driver
  end

  private
    def driver_params
      params.require(:driver).permit(:license, :name)
    end
end
