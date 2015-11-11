class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :kontests, dependent: :destroy         

   def generateCode
      self.codigo =  SecureRandom.hex(6)
   end







end
