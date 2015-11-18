class KontestsController < ApplicationController
  before_action :authenticate_admin!

  def index
   @kontests = Kontest.all
  end

  def show
   @kontest = Kontest.find params[:id]
   @client = @kontest.client
   @unicodes = Unicode.where(kontest_id: @kontest.id)
  end

  def new
   @kontest = Kontest.new
   @client = Client.find params[:client_id]
   @admin_email = current_admin.email
  end

  def create
   @kontest = Kontest.new kontest_params
   @client = Client.find params[:client_id]
   @kontest.client = @client
   @kontest.generateCode
   
   if @kontest.save
        @kontest.amountcodes.times do
          @code = Unicode.new  
          @code.setValues(@kontest)  
          @code.save
        end
      redirect_to kontest_path(@kontest)
   else
      render :new
   end
  end

  def edit
   @kontest = Kontest.find params[:id]
   @client = @kontest.client
   @admin = current_admin
  end

  def update
   @kontest = Kontest.find params[:id]
   if @kontest.update_attributes kontest_params
      redirect_to kontest_path(@kontest)
   else
      render :edit
   end
  end

  private

  def kontest_params
   params.require(:kontest).permit(:clientcode, :clientname, :startdate, :enddate, :admin, :award, :amountwinners, :amountcodes)
  end

end
