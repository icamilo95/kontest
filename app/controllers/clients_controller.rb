class ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
   @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find params[:id]
  end

  def edit
    @client = Client.find params[:id]
  end

  def update
     @client = Client.find params[:id]
     if @client.update_attributes client_params
        redirect_to client_path(@client)
     else
        render :edit
     end
  end


  private

  def client_params
   params.require(:client).permit(:name,:email,:contacto,:celular,:telefono,:comentarios,:direccion,:codigo,:pais,:ciudad,:logo)
  end


end


  
      