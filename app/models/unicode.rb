class Unicode < ActiveRecord::Base
   belongs_to :kontest

   def generateSecuence
      self.secuence =  SecureRandom.hex(6)
   end

   def setValues (kontestId, clientCodigo)
      self.kontest_id = kontestId
      self.clientcode = clientCodigo
      generateSecuence
   end
end
