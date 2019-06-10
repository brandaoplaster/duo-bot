class Hashtag < ActiveRecord::Base
  validates_presence_of :name

  has_many :faq_hashtags
  has_many :faqs, throught: :faq_hashtags
end