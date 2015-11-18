class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
   @user = current_user
  end

  def edit
     @user = current_user
  end

  def update
     @user = current_user     
     if @user.update_attributes user_params
        redirect_to user_show_path(@user)
     else
      render :edit
     end
  end

  def registercode
   @user = current_user
  end

  def addcode
   kontestcode = code_params
   kontest = Kontest.where(kontestcode: kontestcode[0])[0]
   if kontest
      unicode = Unicode.where(secuence: kontestcode[1])[0]
   
      if unicode 
         
         if unicode.user_id == nil
            unicode.user_id = current_user.id 
            unicode.registrationdate = Time.now 
            if unicode.save
               if unicode.winner
                  flash[:message] = "1"      

                  redirect_to result_path(current_user)    
               else
                  flash[:message] = "2"      
                  redirect_to result_path(current_user) 
               end
              
            else
               flash[:message] = "Error, por favor ingreasr codigo nuevamente"
               render :registercode            
            end    
         else
            if unicode.user_id == current_user.id
               flash[:message] = "3"      
               redirect_to result_path(current_user)      
            else
               flash[:message] = "4"      
               redirect_to result_path(current_user)   
            end
            
         end

         
      else
         flash[:message] = "5"      
         redirect_to result_path(current_user)
      end

   else
      flash[:message] = "6"
      redirect_to result_path(current_user)
   end
   
   

  end





  private

  def user_params
   params.require(:user).permit(:nombre,:apellido,:email,:edad,:genero,:celular,:direccion,:pais,:ciudad)
  end

  def code_params
    form = []
    form << params[:kontestcode]
    form << params[:unicode]
  end
end