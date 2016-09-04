class MainController < ApplicationController
  before_filter :authenticate_user!
  def index
    redirect_to :action => :home
  end

  def home
    render :show_panel, layout: 'dashboard'
  end

  def show_panel
    redirect_to :action => :home
  end

  def inbox_task
    render layout: false
  end

end