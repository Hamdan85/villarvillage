class InicialController < ApplicationController
  def index
    @artists = Artist.paginate(:page => params[:page], :per_page => 4)
  end

  def contato

  end

  def quemsomos

  end

  def search

  end
end
