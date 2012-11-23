class Pitch < ActiveRecord::Base
  attr_accessible :label, :location, :outcome, :player_id
  
  validates :label,  presence: true
  validates :outcome, presence: true
  validates :location, presence: true
  
  belongs_to :player
  
  def to_s
    "label: " + label.to_s + " " + "location: " + location.to_s + " " + "outcome: " + outcome.to_s
  end
  
end
