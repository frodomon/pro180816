class VouchersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @vouchers = Voucher.all
    render layout: false
  end

  def show
    @voucher = Voucher.find(params[:id])
    render layout: false
  end

  def new
    @voucher = Voucher.new
    @articles = Article.all
    @clients = Client.all
    @today = Time.now.to_date
    render layout: false
  end

  def create
    flash[:error] = nil
    voucher = Voucher.new(voucher_parameters)
    if voucher.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      voucher.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @voucher = voucher
      render :new, layout: false 
    end
  end

  def edit
    @voucher = Voucher.find(params[:id])
    @articles = Article.all
    @clients = Client.all
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    voucher = Voucher.find(params[:id])
    if voucher.update_attributes(voucher_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      voucher.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @voucher = voucher
      render :edit, layout: false
    end
  end

  def destroy
    voucher = Voucher.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el contrato seleccionado."
    render :json => voucher
  end

  def add_item
    @reg_n = ((Time.now.to_f)*100).to_i
    @article = Article.find(params[:article_id])
    render(partial: 'items', :layout => false)
  end

  private
  def voucher_parameters
    params.require(:voucher).permit(:client_id, :code, :date_of_issue,
      voucher_details_attributes: [:article_id,:quantity,:unit_price,:total_price,:_destroy])
  end
end