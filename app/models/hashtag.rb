class Hashtag < ActiveRecord::Base
  validates_presences_of :name
  
end