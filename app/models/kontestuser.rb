class Kontestuser < ActiveRecord::Base
   belongs_to :user
   belongs_to :kontest
end
