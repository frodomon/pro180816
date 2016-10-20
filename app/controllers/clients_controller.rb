class ClientsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @client = Client.all
    render layout: false
  end

  def show
    @client = Client.find(params[:id])
    render layout: false
  end

  def new
    @client = Client.new 
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    client = Client.new(client_parameters)
    if client.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      client.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @client = client
      render :new, layout: false 
    end
  end

  def edit
    @client = Client.find(params[:id])
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    client = Client.find(params[:id])
    if client.update_attributes(client_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      client.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @client = client
      render :edit, layout: false
    end
  end

  def destroy
    client = Client.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el cliente seleccionado."
    render :json => client
  end
  
  private
    def client_parameters
      params.require(:client).permit(:name,:ruc,:address,:phone,:contact)
    end
end