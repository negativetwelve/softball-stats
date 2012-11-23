class Pitch < ActiveRecord::Base
  attr_accessible :label, :location, :outcome
  belongs_to :player
  
end
