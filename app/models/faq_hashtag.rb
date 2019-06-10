class FaqHashtag < ActiveRecord::Base
  validates_presence_of :faq_id, :hashtag_id
end