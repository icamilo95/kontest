class Kontest < ActiveRecord::Base
   belongs_to :client
   has_many :unicodes, dependent: :destroy

   # def generateSecuence
      
   # end
end
