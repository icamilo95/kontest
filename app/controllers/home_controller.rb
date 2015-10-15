class HomeController < ApplicationController
  before_action :authenticate_user!

   def index
      if user_signed_in?
         if current_user.role == "admin"
            redirect_to homeadminindex_path
         elsif current_user.role == "client"
            redirect_to homeclientindex_path
         else
            redirect_to homeuserindex_path   
         end
      end
   end






end
