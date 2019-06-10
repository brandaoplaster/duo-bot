class Faq < ActiveRecord::base
  validates_presence_of :question, :answer

  has_many :faq_hashtags
  has_many :hashtags, through: :faq_hashtags
end