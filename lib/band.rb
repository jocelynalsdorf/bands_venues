class Band < ActiveRecord::Base
   has_and_belongs_to_many(:venues)
   validates(:name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})


end
