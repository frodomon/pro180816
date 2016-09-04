class ContractsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @contracts = Contract.all
    render layout: false
  end

  def show
    @contract = Contract.find(params[:id])
    render layout: false
  end

  def new
    @contract = Contract.new
    @articles = Article.all
    @clients = Client.all
    @today = Time.now.to_date
    render layout: false
  end

  def create
    flash[:error] = nil
    contract = Contract.new(contract_parameters)
    contract.date_of_issue = Time.now.to_date
    contract.missing_payment = contract.final_price
    if contract.save
      contract.contract_details.each do |cd|
        cd.missing_article = cd.quantity
        cd.save
      end
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      contract.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @contract = contract
      render :new, layout: false 
    end
  end

  def edit
    @contract = Contract.find(params[:id])
    @articles = Article.all
    @clients = Client.all
    @today = @contract.date_of_issue
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    contract = Contract.find(params[:id])
    if contract.update_attributes(contract_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      contract.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @contract = contract
      render :edit, layout: false
    end
  end

  def destroy
    contract = Contract.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el contrato seleccionado."
    render :json => contract
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
  def contract_parameters
    params.require(:contract).permit(:name, :client_id, :code, :date_of_issue, :start_date, :end_date, :final_price,
      contract_details_attributes: [:article_id,:quantity,:unit_price,:total_price,:_destroy],
      contract_documents_attributes: [:document,:_destroy])
  end
end