class RemissionGuidesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @remission_guides = RemissionGuide.all
    render layout: false
  end

  def show
    @remission_guide = RemissionGuide.find(params[:id])
    render layout: false
  end

  def new
    @remission_guide = RemissionGuide.new
    @articles = Article.all
    @clients = Client.all
    @transports = Transport.all
    @today = Time.now.to_date
    render layout: false
  end

  def create
    flash[:error] = nil
    remission_guide = RemissionGuide.new(remission_guide_parameters)
    if remission_guide.save
      remission_guide.remission_guide_details.each do |rgd|
        article = Article.find(rgd.article_id)
        article.stock = article.stock - rgd.quantity
        article.save
      end
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      remission_guide.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @remission_guide = remission_guide
      render :new, layout: false 
    end
  end

  def edit
    @remission_guide = RemissionGuide.find(params[:id])
    @articles = Article.all
    @clients = Client.all
    @transports = Transport.all
    @action = 'edit'
    render layout: false
  end

  def update
    flash[:error] = nil
    remission_guide = RemissionGuide.find(params[:id])
    if remission_guide.update_attributes(remission_guide_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      remission_guide.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @remission_guide = remission_guide
      render :edit, layout: false
    end
  end

  def destroy
    remission_guide = RemissionGuide.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el contrato seleccionado."
    render :json => remission_guide
  end

  def add_item
    @reg_n = ((Time.now.to_f)*100).to_i
    @article = Article.find(params[:article_id])
    render(partial: 'items', :layout => false)
  end

  private
  def remission_guide_parameters
    params.require(:remission_guide).permit(:client_id, :code, :date_of_issue, :initial_point, :final_point, :transport_id,
      remission_guide_details_attributes: [:article_id,:quantity,:unit_price,:total_price,:_destroy])
  end
end