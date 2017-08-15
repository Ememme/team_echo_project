class HomeController < ApplicationController

  def index
    @denounces = Denounce.all
  end
end
