class HomeController < ApplicationController
  

  def index
      if user_signed_in?
         redirect_to indexuser_path
      elsif client_signed_in?
         redirect_to indexclient_path
      elsif admin_signed_in?
         redirect_to indexadmin_path
      end
  end
end
