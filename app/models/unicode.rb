class Unicode < ActiveRecord::Base
   belongs_to :kontest

   
   def setValues (kontest, clientCodigo)
      self.kontest_id = kontest.id
      self.clientcode = clientCodigo
      generateSecuence(clientCodigo, kontest)
   end

   def generateSecuence(clientCodigo, kontest)
      newSecuence =  SecureRandom.hex(6)
      checkRepetedCodes(newSecuence, clientCodigo, kontest)
   end

   def checkRepetedCodes(newSecuence, clientCodigo, kontest)
      unicodes = Unicode.where(clientcode: clientCodigo)
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
