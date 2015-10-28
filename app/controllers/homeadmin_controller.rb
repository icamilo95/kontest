class HomeadminController < ApplicationController
   before_action :authenticate_admin!

end
