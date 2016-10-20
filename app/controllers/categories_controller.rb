class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update ]
  protect_from_forgery with: :null_session, :only => [:destroy, :delete]
  def index
    @category = Category.all
    render layout: false
  end

  def show
    @category = Category.find(params[:id])
    render layout: false
  end

  def new
    @category = Category.new
    @today = Time.now
    render layout: false
  end

  def create
    flash[:error] = nil
    category = Category.new(category_params)
    if category.save
      flash[:notice] = "Se ha creado correctamente."
      redirect_to :action => :index
    else
      category.errors.messages.each do |attribute, error|
        puts flash[:error].to_s + error.to_s + "  "
      end
      @category = category
      render :new, layout: false 
    end
  end

  def edit
    @category = Category.find(params[:id])
    @action = 'edit'
    render layout: false
  end
  
  def update
    flash[:error] = nil
    category = Category.find(params[:id])
    if category.update_attributes(category_params)
      flash[:notice] = "Se ha actualizado correctamente los datos."
      redirect_to :action => :index
    else
      category.errors.messages.each do |attribute, error|
        flash[:error] =  flash[:error].to_s + error.to_s + "  "
      end
      @category = category
      render :edit, layout: false
    end
  end

  def destroy
    category = Category.destroy(params[:id])
    flash[:notice] = "Se ha eliminado correctamente el cliente seleccionado."
    render :json => category
  end
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
