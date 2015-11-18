class Unicode < ActiveRecord::Base
   belongs_to :kontest

   
   def setValues (kontest)
      self.kontest_id = kontest.id
      self.kontestcode = kontest.kontestcode
      generateSecuence(kontest)
   end

   def generateSecuence(kontest)
      newSecuence =  SecureRandom.hex(6)
      checkRepetedCodes(newSecuence, kontest)
   end

   def checkRepetedCodes(newSecuence, kontest)
      unicodes = Unicode.where(kontestcode: kontest.kontestcode)
      if unicodes.include?(newSecuence)
         self.secuence = "Repeated code - Repeated code - ALERT"
      else
         kontest.amountwinners -= 1
         if kontest.amountwinners >= 0
            self.winner = true   
         end
         self.secuence = newSecuence
      end 
   end


end
