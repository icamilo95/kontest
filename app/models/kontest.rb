class Kontest < ActiveRecord::Base
   validates   :startdate, :enddate, :award, presence: true
   belongs_to :client
   has_many :unicodes, dependent: :destroy
   
   has_many :kontestusers
   has_many :users, :through => :kontestusers

   # private

   def generateCode
      self.kontestcode =  SecureRandom.hex(3)
      check_repeted_codes(self.kontestcode)
   end

   def check_repeted_codes(new_code)
      kontest = Kontest.where(kontestcode: new_code)
      if kontest.length != 0
         generateCode
      end
   end

end



