class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :number
  has_many :pitches, dependent: :destroy
  
  belongs_to :user
end
