class TransportsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @transport = Transport.all
    render layout: false
  end

  def show
    @transport = Transport.find(params[:id])
    render layout: false
  end

  def new
    @transport = Transport.new 
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    transport = Transport.new(transport_parameters)
    if transport.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      transport.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @transport = transport
      render :new, layout: false 
    end
  end

  def edit
    @transport = Transport.find(params[:id])
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    transport = Transport.find(params[:id])
    if transport.update_attributes(transport_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      transport.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @transport = transport
      render :edit, layout: false
    end
  end

  def destroy
    transport = Transport.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente."
    render :json => transport
  end
  
  private
  def transport_parameters
    params.require(:transport).permit(:plate,:trademark)
  end
end