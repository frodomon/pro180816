class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @article = Article.all
    render layout: false
  end

  def show
    @article = Article.find(params[:id])
    render layout: false
  end

  def new
    @article = Article.new 
    @today = Time.now
    @categories = Category.all
    render layout: false
  end

  def create
    flash[:error] = nil
    article = Article.new(article_parameters)
    article.stock = 0
    if article.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      article.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @article = article
      render :new, layout: false 
    end
  end

  def edit
    @article = Article.find(params[:id])
    @action = 'edit'
    @categories = Category.all
    render layout: false
  end

  def update
    flash[:error] = nil
    article = Article.find(params[:id])
    if article.update_attributes(article_parameters)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      article.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @article = article
      render :edit, layout: false
    end
  end

  def destroy
    article = Article.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el cliente seleccionado."
    render :json => article
  end
  
  private
  def article_parameters
    params.require(:article).permit(:name,:code,:unit_of_measurement, :sanitary_registry, :trademark)
  end
end