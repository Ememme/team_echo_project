class HomeController < ApplicationController

  def index
    @denounces = Denounce.paginate(:page => params[:page], :per_page => 30).decorate
  end
end
