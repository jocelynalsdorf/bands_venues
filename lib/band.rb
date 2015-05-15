class Band < ActiveRecord::Base
   has_and_belongs_to_many(:venues)
   #before_save(:capitalize_title)
   validates(:name, {:presence => true, :length => {:maximum => 50}})

private
    #  define_method(:capitalize_title) do
    #   self.title = title.capitalize()
    end
end
