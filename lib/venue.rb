class Venue < ActiveRecord::Base
   has_and_belongs_to_many(:bands)
   validates(:name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
   

end
